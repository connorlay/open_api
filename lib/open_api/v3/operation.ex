defmodule OpenAPI.V3.Operation do
  @moduledoc """
  Describes a single API operation on a path.
  """

  use OpenAPI.Object

  defobject [
    {:tags, [:string], []},
    {:summary, :string, []},
    {:description, :string, []},
    {:external_docs, OpenAPI.V3.ExternalDocumentation, []},
    {:operation_id, :string, []},
    {:parameters, [{OpenAPI.V3.Reference, OpenAPI.V3.Parameter}], []},
    {:request_body, {OpenAPI.V3.Reference, OpenAPI.V3.RequestBody}, []},
    {:responses, %{string: OpenAPI.V3.Response}, []},
    {:callbacks, %{string: {OpenAPI.V3.Reference, %{string: OpenAPI.V3.PathItem}}}, []},
    {:deprecated, :boolean, []},
    {:security, [%{string: [:string]}], []},
    {:servers, [OpenAPI.V3.Server], []}
  ]
end
