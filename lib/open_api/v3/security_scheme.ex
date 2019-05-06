defmodule OpenAPI.V3.SecurityScheme do
  @moduledoc """
  Defines a security scheme that can be used by the operations. Supported schemes are HTTP authentication, an API key (either as a header, a cookie parameter or as a query parameter), OAuth2's common flows (implicit, password, application and access code) as defined in RFC6749, and OpenID Connect Discovery.
  """

  use OpenAPI.Object

  defobject title: {
              :string,
              []
            },
            description: {
              :string,
              []
            },
            name: {
              :string,
              []
            },
            in: {
              :string,
              []
            },
            scheme: {
              :string,
              []
            },
            bearer_format: {
              :string,
              []
            },
            flows: {
              OpenAPI.V3.OAuthFlows,
              []
            },
            open_id_connect_url: {
              :string,
              []
            }
end
