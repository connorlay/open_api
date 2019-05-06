defmodule OpenAPI.V3.Reference do
  @moduledoc """
  A simple object to allow referencing other components in the specification, internally and externally.
  """

  use OpenAPI.Object

  defobject "$ref": {
              :string,
              [required: true]
            }
end
