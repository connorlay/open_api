defmodule OpenAPI.V3.OpenAPI do
  @moduledoc """
  This is the root document object of the Open API document.
  """

  use OpenAPI.Object

  defobject [
    {:openapi, :string, []},
    {:info, OpenAPI.V3.Info, []},
    {:servers, [OpenAPI.V3.Server], []},
    {:paths, OpenAPI.V3.Paths, []},
    {:components, OpenAPI.V3.Components, []},
    {:security, [OpenAPI.V3.SecurityRequirement], []},
    {:tags, [OpenAPI.V3.Tag], []},
    {:external_docs, OpenAPI.V3.ExternalDocumentation, []}
  ]
end
