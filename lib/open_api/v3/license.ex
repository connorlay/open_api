defmodule OpenAPI.V3.License do
  @moduledoc """
  License information for the exposed API.
  """

  use OpenAPI.Object

  defobject name: {
              :string,
              []
            },
            url: {
              :string,
              []
            }
end
