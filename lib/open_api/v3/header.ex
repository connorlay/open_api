defmodule OpenAPI.V3.Header do
  @moduledoc """
  The Header Object follows the structure of the Parameter Object with the following changes:

    - name MUST NOT be specified, it is given in the corresponding headers map.
    - in MUST NOT be specified, it is implicitly in header.
    - All traits that are affected by the location MUST be applicable to a location of header (for example, style).
  """

  use OpenAPI.Object

  defobject description: {
              :string,
              []
            },
            required: {
              :boolean,
              []
            },
            deprecated: {
              :boolean,
              []
            },
            allow_empty_value: {
              :boolean,
              []
            },
            style: {
              :string,
              []
            },
            explode: {
              :boolean,
              []
            },
            allow_reserved: {
              :boolean,
              []
            },
            schema: {
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
            content: {
              {:map, [:string, OpenAPI.V3.MediaType]},
              []
            }
end
