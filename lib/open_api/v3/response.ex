defmodule OpenAPI.V3.Response do
  @moduledoc """
  Describes a single response from an API Operation, including design-time, static links to operations based on the response.
  """

  use OpenAPI.Object

  defobject description: {
              :string,
              []
            },
            headers: {
              {:map, [:string, {:union, [OpenAPI.V3.Header, OpenAPI.V3.Reference]}]},
              []
            },
            content: {
              {:map, [:string, OpenAPI.V3.MediaType]},
              []
            },
            links: {
              {:map, [:string, {:union, [OpenAPI.V3.Link, OpenAPI.V3.Reference]}]},
              []
            }
end
