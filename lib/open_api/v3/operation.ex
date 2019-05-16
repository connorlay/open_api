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
              {:list, [{:union, [OpenAPI.V3.Reference, OpenAPI.V3.Parameter]}]},
              []
            },
            request_body: {
              {:union, [OpenAPI.V3.Reference, OpenAPI.V3.RequestBody]},
              []
            },
            responses: {
              {:map, [:string, OpenAPI.V3.Response]},
              []
            },
            callbacks: {
              {:map,
               [:string, {:union, [{:map, [:string, OpenAPI.V3.Reference, OpenAPI.V3.PathItem]}]}]},
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
