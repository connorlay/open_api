defmodule OpenAPI.V3.Encoding do
  @moduledoc """
  A single encoding definition applied to a single schema property.
  """

  use OpenAPI.Object

  defobject content_type: {
              :string,
              []
            },
            headers: {
              {:map, [:string, {:union, [OpenAPI.V3.Header, OpenAPI.V3.Reference]}]},
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
            }
end
