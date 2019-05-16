defmodule OpenAPI.V3.OpenAPI do
  @moduledoc """
  This is the root document object of the Open API document.
  """

  use OpenAPI.Object

  defobject openapi: {
              :string,
              [required: true]
            },
            info: {
              OpenAPI.V3.Info,
              [required: true]
            },
            servers: {
              {:list, [OpenAPI.V3.Server]},
              []
            },
            paths: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.PathItem]}]},
              [required: true]
            },
            components: {
              OpenAPI.V3.Components,
              []
            },
            security: {
              {:list, [{:map, [:string, {:list, [:string]}]}]},
              []
            },
            tags: {
              {:list, [OpenAPI.V3.Tag]},
              []
            },
            external_docs: {
              OpenAPI.V3.ExternalDocumentation,
              []
            }
end
