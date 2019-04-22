defmodule OpenAPI.V3.RequestBody do
  @moduledoc """
  Describes a single request body.
  """

  use OpenAPI.Object

  defobject [
    {:description, :string, []},
    {:content, %{string: OpenAPI.V3.MediaType}, []},
    {:required, :boolean, []}
  ]
end
