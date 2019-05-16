defmodule OpenAPI.V3.Components do
  @moduledoc """
  Holds a set of reusable objects for different aspects of the OAS. All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.
  """

  use OpenAPI.Object

  defobject schemas: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Schema]}]},
              []
            },
            responses: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Responses]}]},
              []
            },
            parameters: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Parameter]}]},
              []
            },
            examples: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Example]}]},
              []
            },
            request_bodies: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.RequestBody]}]},
              []
            },
            headers: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Header]}]},
              []
            },
            security_schemes: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.SecurityScheme]}]},
              []
            },
            links: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Link]}]},
              []
            },
            callbacks: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.PathItem]}]},
              []
            }
end
