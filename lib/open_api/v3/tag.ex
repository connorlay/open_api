defmodule OpenAPI.V3.Tag do
  @moduledoc """
  Adds metadata to a single tag that is used by the Operation Object. It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
  """

  use OpenAPI.Object

  defobject name: {
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
            }
end
