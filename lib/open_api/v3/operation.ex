defmodule OpenAPI.V3.Operation do
  @moduledoc """
  Describes a single API operation on a path.
  """

  use OpenAPI.Object

  defobject tags: {
              {:list, [:string]},
              []
            },
            summary: {
              :string,
              []
            },
            description: {
              :string,
              []
            },
            external_docs: {
              OpenAPI.V3.ExternalDocumentation,
              []
            },
            operation_id: {
              :string,
              []
            },
            parameters: {
              {:list, [{:union, [OpenAPI.V3.Parameter, OpenAPI.V3.Reference]}]},
              []
            },
            request_body: {
              {:union, [OpenAPI.V3.RequestBody, OpenAPI.V3.Reference]},
              []
            },
            responses: {
              {:map, [:string, OpenAPI.V3.Response]},
              []
            },
            callbacks: {
              {:map,
               [:string, {:union, [{:map, [:string, OpenAPI.V3.PathItem]}, OpenAPI.V3.Reference]}]},
              []
            },
            deprecated: {
              :boolean,
              []
            },
            security: {
              {:list, [{:map, [:string, {:list, [:string]}]}]},
              []
            },
            servers: {
              {:list, [OpenAPI.V3.Server]},
              []
            }
end
