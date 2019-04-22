defmodule OpenAPI.V3.OAuthFlow do
  @moduledoc """
  Configuration details for a supported OAuth Flow
  """

  use OpenAPI.Object

  defobject [
    {:authorization_url, :string, []},
    {:token_url, :string, []},
    {:refresh_url, :string, []},
    {:scopes, %{string: :string}, []}
  ]
end
