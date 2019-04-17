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

  @type container :: [type, ...] | %{type => type} | {type, type}

  @type type :: primitive | container

  @type name :: atom | String.t()

  @type options :: []

  @type field :: {atom, type, options}

  @doc false
  defmacro defobject(fields) do
    # TODO read from config for extension types
    struct_keys =
      Enum.map(fields, fn
        {:{}, _, [name, _type, _opts]} -> name
      end)

    quote do
      defstruct(unquote(struct_keys))
      def __object__, do: unquote(fields)
    end
  end
end
