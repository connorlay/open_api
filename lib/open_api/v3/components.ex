defmodule OpenAPI.V3.Components do
  @moduledoc """
  Holds a set of reusable objects for different aspects of the OAS. All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.
  """

  use OpenAPI.Object

  defobject [
    {:schemas, %{string: {OpenAPI.V3.Schema, OpenAPI.V3.Reference}}, []},
    {:responses, %{string: {OpenAPI.V3.Responses, OpenAPI.V3.Reference}}, []},
    {:parameters, %{string: {OpenAPI.V3.Parameter, OpenAPI.V3.Reference}}, []},
    {:examples, %{string: {OpenAPI.V3.Example, OpenAPI.V3.Reference}}, []},
    {:request_bodies, %{string: {OpenAPI.V3.RequestBody, OpenAPI.V3.Reference}}, []},
    {:headers, %{string: {OpenAPI.V3.Header, OpenAPI.V3.Reference}}, []},
    {:security_schemes, %{string: {OpenAPI.V3.SecurityScheme, OpenAPI.V3.Reference}}, []},
    {:links, %{string: {OpenAPI.V3.Link, OpenAPI.V3.Reference}}, []},
    {:callbacks, %{string: {%{string: OpenAPI.V3.PathItem}, OpenAPI.V3.Reference}}, []}
  ]
end
