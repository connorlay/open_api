defmodule OpenAPI.V3.Info do
  @moduledoc """
  The object provides metadata about the API. The metadata MAY be used by the clients if needed, and MAY be presented in editing or documentation generation tools for convenience.
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
            terms_of_service: {
              :string,
              []
            },
            contact: {
              OpenAPI.V3.Contact,
              []
            },
            license: {
              OpenAPI.V3.License,
              []
            },
            version: {
              :string,
              []
            }
end
