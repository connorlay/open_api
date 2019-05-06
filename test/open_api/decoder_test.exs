defmodule OpenAPI.DecoderTest do
  use ExUnit.Case

  @petstore "./test/examples/petstore.yaml" |> YamlElixir.read_from_file!()

  @petstore_document %OpenAPI.V3.OpenAPI{
    openapi: "3.0.0",
    info: %OpenAPI.V3.Info{
      version: "1.0.0",
      title: "Swagger Petstore",
      license: %OpenAPI.V3.License{
        name: "MIT"
      }
    },
    servers: [
      %OpenAPI.V3.Server{
        url: "http://petstore.swagger.io/v1"
      }
    ],
    components: %OpenAPI.V3.Components{},
    paths: %{
      "/pets" => %OpenAPI.V3.Reference{},
      "/pets/{petId}" => %OpenAPI.V3.Reference{}
    }
  }

  test "parse/3" do
    assert {:ok, document} = OpenAPI.Decoder.parse(@petstore, OpenAPI.V3.OpenAPI)
    assert @petstore_document == document
  end
end
