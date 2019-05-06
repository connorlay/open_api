defmodule OpenAPI.Object do
  @moduledoc false

  @doc false
  defmacro __using__(_) do
    quote do
      require OpenAPI.Object
      import OpenAPI.Object
    end
  end

  @type primitive :: :string | :number | :boolean | :integer | module

  @type container :: {:map | :union | :list, [type]}

  @type type :: primitive | container

  @type name :: atom | String.t()

  @type options :: [
          required: boolean()
        ]

  @type field :: {atom, type, options}

  @doc false
  defmacro defobject(fields) do
    # TODO read from config for extension types
    struct_keys = Keyword.keys(fields)

    quote do
      defstruct(unquote(struct_keys))
      def __object__, do: unquote(fields)

      defimpl Inspect, for: __MODULE__ do
        def inspect(object, opts) do
          inspect_object(object, opts)
        end
      end
    end
  end

  import Inspect.Algebra

  def inspect_object(object, opts) do
    inner =
      object
      |> Map.from_struct()
      |> Enum.reject(&is_nil(elem(&1, 1)))

    concat(["#", inspect(object.__struct__), "<", to_doc(inner, opts), ">"])
  end
end
