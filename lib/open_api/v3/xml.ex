defmodule OpenAPI.V3.XML do
  @moduledoc """
  A metadata object that allows for more fine-tuned XML model definitions.

  When using arrays, XML element names are not inferred (for singular/plural forms) and the name property SHOULD be used to add that information. See examples for expected behavior.
  """

  use OpenAPI.Object

  defobject name: {
              :string,
              []
            },
            namespace: {
              :string,
              []
            },
            prefix: {
              :string,
              []
            },
            attribute: {
              :boolean,
              []
            },
            wrapped: {
              :boolean,
              []
            }
end
