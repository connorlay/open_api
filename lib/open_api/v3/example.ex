defmodule OpenAPI.V3.Example do
  @moduledoc """
  An example value.
  In all cases, the example value is expected to be compatible with the type schema of its associated value. Tooling implementations MAY choose to validate compatibility automatically, and reject the example value(s) if incompatible.
  """

  use OpenAPI.Object

  defobject [
    {:summary, :string, []},
    {:description, :string, []},
    {:value, :any, []},
    {:external_value, :string, []}
  ]
end
