defmodule OpenAPI.V3.MediaType do
  @moduledoc """
  Each Media Type Object provides schema and examples for the media type identified by its key.
  """

  use OpenAPI.Object

  defobject schema: {
              {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Schema]},
              []
            },
            example: {
              :any,
              []
            },
            examples: {
              {:map, [:string, {:union, [OpenAPI.V3.Reference, OpenAPI.V3.Example]}]},
              []
            },
            encoding: {
              {:map, [:string, OpenAPI.V3.Encoding]},
              []
            }
end
