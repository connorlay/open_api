defmodule OpenAPI.DecoderError do
  @moduledoc """
  Raised when there is an error decoding an
  Open API document.
  """

  defstruct [
    :message,
    :location
  ]
end

defmodule OpenAPI.Decoder do
  @moduledoc false

  # Track location while parsing to give
  # helpful error messages
  def parse(input, object, location \\ []) do
    coerce(input, object, location)
  end

  # Primitives
  defp coerce(value, :string, _location) when is_binary(value) do
    {:ok, value}
  end

  defp coerce(value, :number, _location) when is_number(value) do
    {:ok, value}
  end

  defp coerce(value, :boolean, _location) when is_boolean(value) do
    {:ok, value}
  end

  defp coerce(value, :integer, _location) when is_integer(value) do
    {:ok, value}
  end

  defp coerce(value, _type, _location) when is_nil(value) do
    {:ok, value}
  end

  # Containers
  defp coerce(value, [module], location) when is_list(value) do
    value
    |> Enum.map(&coerce(&1, module, location))
    |> reduce_coercions()
  end

  defp coerce(value, {left, right}, location) do
    case coerce(value, left, location) do
      {:error, _errors} ->
        coerce(value, right, location)

      {:ok, value} ->
        {:ok, value}
    end
  end

  defp coerce(value, map, location) when is_map(value) and is_map(map) do
    [{key, value} | _] = Map.to_list(map)

    value
    |> Enum.map(fn {k, v} ->
      case {coerce(k, key, location), coerce(v, value, location)} do
        {{:ok, k}, {:ok, v}} ->
          {:ok, {k, v}}

        {{:ok, _}, {:error, v_errors}} ->
          {:error, v_errors}

        {{:error, k_errors}, {:ok, _}} ->
          {:error, k_errors}

        {{:error, k_errors}, {:error, v_errors}} ->
          {:error, k_errors ++ v_errors}
      end
    end)
    |> reduce_coercions()
    |> after_coercion(&Enum.into(&1, %{}))
  end

  # Objects
  defp coerce(value, module, location) when is_map(value) do
    module.__object__
    |> Enum.map(fn {name, type, opts} ->
      sname = Atom.to_string(name)
      location = [name | location]

      case coerce(Map.get(value, sname), type, location) do
        {:ok, coerced} ->
          {:ok, {name, coerced}}

        {:error, errors} ->
          {:error, errors}
      end
    end)
    |> reduce_coercions()
    |> after_coercion(&struct(module, &1))
  end

  defp coerce(value, type, location) do
    error = %OpenAPI.DecoderError{
      message: "Failed to coerved #{inspect(value)} to type #{inspect(type)}",
      location: fmt_location(location)
    }

    {:error, [error]}
  end

  # Pretty prints the current location in the document tree
  defp fmt_location(location) do
    "##{location |> Enum.reverse() |> Enum.join("/")}"
  end

  # Converts a list of coercions into one coercion
  defp reduce_coercions(coercions) do
    coercions
    |> Enum.reduce({[], []}, fn
      {:ok, coerced}, {all_coerced, all_errors} ->
        {[coerced | all_coerced], all_errors}

      {:error, errors}, {all_coerced, all_errors} ->
        {all_coerced, errors ++ all_errors}
    end)
    |> case do
      {all_coerced, []} ->
        {:ok, all_coerced}

      {_all_coerced, all_errors} ->
        {:error, all_errors}
    end
  end

  # Calls the provided function of a coercion if successful
  defp after_coercion({:ok, coerced}, fun), do: {:ok, fun.(coerced)}
  defp after_coercion({:error, errors}, _fun), do: {:error, errors}
end
