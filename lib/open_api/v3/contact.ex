defmodule OpenAPI.V3.Contact do
  @moduledoc """
  Contact information for the exposed API.
  """

  use OpenAPI.Object

  defobject name: {
              :string,
              []
            },
            url: {
              :string,
              []
            },
            email: {
              :string,
              []
            }
end
