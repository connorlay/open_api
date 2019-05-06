defmodule OpenAPI.V3.OAuthFlows do
  @moduledoc """
  Allows configuration of the supported OAuth Flows.
  """

  use OpenAPI.Object

  defobject implicit: {
              OpenAPI.V3.OAuthFlow,
              []
            },
            password: {
              OpenAPI.V3.OAuthFlow,
              []
            },
            client_credentials: {
              OpenAPI.V3.OAuthFlow,
              []
            },
            authorization_code: {
              OpenAPI.V3.OAuthFlow,
              []
            }
end
