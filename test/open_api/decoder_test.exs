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
    paths: %{
      "/pets" => %OpenAPI.V3.PathItem{
        get: %OpenAPI.V3.Operation{
          summary: "List all pets",
          operation_id: "listPets",
          tags: [
            "pets"
          ],
          parameters: [
            %OpenAPI.V3.Parameter{
              name: "limit",
              in: "query",
              description: "How many items to return at one time (max 100)",
              required: false,
              schema: %OpenAPI.V3.Schema{
                type: "integer",
                format: "int32"
              }
            }
          ],
          responses: %{
            "200" => %OpenAPI.V3.Response{
              description: "A paged array of pets",
              headers: %{
                "x-next" => %OpenAPI.V3.Header{
                  description: "A link to the next page of responses",
                  schema: %OpenAPI.V3.Schema{
                    type: "string"
                  }
                }
              },
              content: %{
                "application/json" => %OpenAPI.V3.MediaType{
                  schema: %OpenAPI.V3.Reference{
                    "$ref": "#/components/schemas/Pets"
                  }
                }
              }
            },
            "default" => %OpenAPI.V3.Response{
              description: "unexpected error",
              content: %{
                "application/json" => %OpenAPI.V3.MediaType{
                  schema: %OpenAPI.V3.Reference{
                    "$ref": "#/components/schemas/Error"
                  }
                }
              }
            }
          }
        },
        post: %OpenAPI.V3.Operation{
          summary: "Create a pet",
          operation_id: "createPets",
          tags: [
            "pets"
          ],
          responses: %{
            "201" => %OpenAPI.V3.Response{
              description: "Null response"
            },
            "default" => %OpenAPI.V3.Response{
              description: "unexpected error",
              content: %{
                "application/json" => %OpenAPI.V3.MediaType{
                  schema: %OpenAPI.V3.Reference{
                    "$ref": "#/components/schemas/Error"
                  }
                }
              }
            }
          }
        }
      },
      "/pets/{petId}" => %OpenAPI.V3.PathItem{
        get: %OpenAPI.V3.Operation{
          summary: "Info for a specific pet",
          operation_id: "showPetById",
          tags: [
            "pets"
          ],
          parameters: [
            %OpenAPI.V3.Parameter{
              name: "petId",
              in: "path",
              required: true,
              description: "The id of the pet to retrieve",
              schema: %OpenAPI.V3.Schema{
                type: "string"
              }
            }
          ],
          responses: %{
            "200" => %OpenAPI.V3.Response{
              description: "Expected response to a valid request",
              content: %{
                "application/json" => %OpenAPI.V3.MediaType{
                  schema: %OpenAPI.V3.Reference{
                    "$ref": "#/components/schemas/Pets"
                  }
                }
              }
            },
            "default" => %OpenAPI.V3.Response{
              description: "unexpected error",
              content: %{
                "application/json" => %OpenAPI.V3.MediaType{
                  schema: %OpenAPI.V3.Reference{
                    "$ref": "#/components/schemas/Error"
                  }
                }
              }
            }
          }
        }
      }
    },
    components: %OpenAPI.V3.Components{
      schemas: %{
        "Pet" => %OpenAPI.V3.Schema{
          required: [
            "id",
            "name"
          ],
          properties: %{
            "id" => %OpenAPI.V3.Schema{
              type: "integer",
              format: "int64"
            },
            "name" => %OpenAPI.V3.Schema{
              type: "string"
            },
            "tag" => %OpenAPI.V3.Schema{
              type: "string"
            }
          }
        },
        "Pets" => %OpenAPI.V3.Schema{
          type: "array",
          items: %OpenAPI.V3.Reference{
            "$ref": "#/components/schemas/Pet"
          }
        },
        "Error" => %OpenAPI.V3.Schema{
          required: [
            "code",
            "message"
          ],
          properties: %{
            "code" => %OpenAPI.V3.Schema{
              type: "integer",
              format: "int32"
            },
            "message" => %OpenAPI.V3.Schema{
              type: "string"
            }
          }
        }
      }
    }
  }

  test "parse/3" do
    assert {:ok, document} = OpenAPI.Decoder.parse(@petstore, OpenAPI.V3.OpenAPI)
    assert @petstore_document == document
  end
end
