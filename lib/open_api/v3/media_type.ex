defmodule OpenAPI.V3.MediaType do
  @moduledoc """
  Each Media Type Object provides schema and examples for the media type identified by its key.
  """

  use OpenAPI.Object

  defobject schema: {
              {:union, [OpenAPI.V3.Schema, OpenAPI.V3.Reference]},
              []
            },
            example: {
              :any,
              []
            },
            examples: {
              {:map, [:string, {:union, [OpenAPI.V3.Example, OpenAPI.V3.Reference]}]},
              []
            },
            encoding: {
              {:map, [:string, OpenAPI.V3.Encoding]},
              []
            }
end
