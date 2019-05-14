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
    coerce(input, object, [], location)
  end

  # Primitives
  defp coerce(term, :string, _opts, _location) when is_binary(term) do
    {:ok, term}
  end

  defp coerce(term, :number, _opts, _location) when is_number(term) do
    {:ok, term}
  end

  defp coerce(term, :boolean, _opts, _location) when is_boolean(term) do
    {:ok, term}
  end

  defp coerce(term, :integer, _opts, _location) when is_integer(term) do
    {:ok, term}
  end

  defp coerce(term, type, opts, location) when is_nil(term) do
    if {:required, true} in opts do
      error = %OpenAPI.DecoderError{
        message: "Expected absent field to be #{inspect(type)}",
        location: fmt_location(location)
      }

      {:error, [error]}
    else
      {:ok, term}
    end
  end

  # Containers
  defp coerce(term, {:list, [type]}, opts, location) when is_list(term) do
    term
    |> Enum.map(&coerce(&1, type, opts, location))
    |> reduce_coercions()
  end

  defp coerce(term, {:union, [left, right]}, opts, location) do
    case coerce(term, left, opts, location) do
      {:error, _errors} ->
        coerce(term, right, opts, location)

      {:ok, term} ->
        {:ok, term}
    end
  end

  defp coerce(term, {:map, [key, value]}, opts, location) when is_map(term) do
    term
    |> Enum.map(fn {k, v} ->
      case {coerce(k, key, opts, location), coerce(v, value, opts, location)} do
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
  defp coerce(term, module, _opts, location) when is_map(term) do
    module.__object__
    |> Enum.map(fn {name, {type, opts}} ->
      sname = Atom.to_string(name)
      location = [name | location]

      case coerce(Map.get(term, sname), type, opts, location) do
        {:ok, coerced} ->
          {:ok, {name, coerced}}

        {:error, errors} ->
          {:error, errors}
      end
    end)
    |> reduce_coercions()
    |> after_coercion(&struct(module, &1))
  end

  defp coerce(term, type, _opts, location) do
    error = %OpenAPI.DecoderError{
      message: "Failed to coerce #{inspect(term)} to type #{inspect(type)}",
      location: fmt_location(location)
    }

    {:error, [error]}
  end

  # Pretty prints the current location in the document tree
  defp fmt_location(location) do
    "#/#{location |> Enum.reverse() |> Enum.join("/")}"
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
