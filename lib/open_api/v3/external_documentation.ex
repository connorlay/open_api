defmodule OpenAPI.V3.ExternalDocumentation do
  @moduledoc """
  Allows referencing an external resource for extended documentation.
  """

  use OpenAPI.Object

  defobject [
    {:description, :string, []},
    {:url, :string, []}
  ]
end
