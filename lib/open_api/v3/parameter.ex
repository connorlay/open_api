defmodule OpenAPI.V3.Parameter do
  @moduledoc """
  Describes a single operation parameter.
  A unique parameter is defined by a combination of a name and location.
  """

  use OpenAPI.Object

  defobject [
    {:name, :string, []},
    {:in, :string, []},
    {:description, :string, []},
    {:required, :boolean, []},
    {:deprecated, :boolean, []},
    {:allow_empty_value, :boolean, []},
    {:style, :string, []},
    {:explode, :boolean, []},
    {:allow_reserved, :boolean, []},
    {:schema, {OpenAPI.V3.Schema, OpenAPI.V3.Reference}, []},
    {:example, :any, []},
    {:examples, %{string: {OpenAPI.V3.Example, OpenAPI.V3.Reference}}, []},
    {:content, %{string: OpenAPI.V3.MediaType}, []}
  ]
end
