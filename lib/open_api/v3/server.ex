defmodule OpenAPI.V3.Server do
  @moduledoc """
  An object representing a Server.
  """

  use OpenAPI.Object

  defobject [
    {:url, :string, []},
    {:description, :string, []},
    {:variables, %{string: OpenAPI.V3.ServerVariable}, []}
  ]
end
