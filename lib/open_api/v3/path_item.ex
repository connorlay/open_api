defmodule OpenAPI.V3.PathItem do
  @moduledoc """
  Describes the operations available on a single path. A Path Item MAY be empty, due to ACL constraints. The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.
  """

  use OpenAPI.Object

  defobject [
    {:summary, :string, []},
    {:description, :string, []},
    {:get, OpenAPI.V3.Operation, []},
    {:put, OpenAPI.V3.Operation, []},
    {:post, OpenAPI.V3.Operation, []},
    {:delete, OpenAPI.V3.Operation, []},
    {:options, OpenAPI.V3.Operation, []},
    {:head, OpenAPI.V3.Operation, []},
    {:patch, OpenAPI.V3.Operation, []},
    {:trace, OpenAPI.V3.Operation, []},
    {:servers, [OpenAPI.V3.Server], []},
    {:parameters, [{OpenAPI.V3.Reference, OpenAPI.V3.Parameter}], []}
  ]
end
