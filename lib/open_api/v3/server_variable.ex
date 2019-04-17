defmodule OpenAPI.V3.ServerVariable do
  @moduledoc """
  An object representing a Server Variable for server URL template substitution.
  """

  use OpenAPI.Object

  defobject [
    {:enum, [:string], []},
    {:default, :string, []},
    {:description, :string, []}
  ]
end
