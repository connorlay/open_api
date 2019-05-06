defmodule OpenAPI.V3.Schema do
  @moduledoc """
  The Schema Object allows the definition of input and output data types. These types can be objects, but also primitives and arrays. This object is an extended subset of the JSON Schema Specification Wright Draft 00.
  """

  use OpenAPI.Object

  defobject title: {
              :string,
              []
            },
            # JSON Schema fields
            multiple_of: {
              :integer,
              []
            },
            maximum: {
              :integer,
              []
            },
            exclusive_minimum: {
              :boolean,
              []
            },
            max_length: {
              :integer,
              []
            },
            min_length: {
              :integer,
              []
            },
            unique_items: {
              :boolean,
              []
            },
            max_properties: {
              :integer,
              []
            },
            min_properties: {
              :integer,
              []
            },
            required: {
              {:list, [:string]},
              []
            },
            enum: {
              {:list, [:any]},
              []
            },
            type: {
              :string,
              []
            },
            all_of: {
              {:list, [{:union, [__MODULE__, OpenAPI.V3.Reference]}]},
              []
            },
            one_of: {
              {:list, [{:union, [__MODULE__, OpenAPI.V3.Reference]}]},
              []
            },
            any_of: {
              {:list, [{:union, [__MODULE__, OpenAPI.V3.Reference]}]},
              []
            },
            not: {
              __MODULE__,
              []
            },
            items: {
              {:union, [__MODULE__, OpenAPI.V3.Reference]},
              []
            },
            properties: {
              {:map, [:string, {:union, [__MODULE__, OpenAPI.V3.Reference]}]},
              []
            },
            additional_properties: {
              {:union, [:boolean, {:union, [__MODULE__, OpenAPI.V3.Reference]}]},
              []
            },
            description: {
              :string,
              []
            },
            format: {
              :string,
              []
            },
            default: {
              :any,
              []
            },
            # Open API fields
            nullable: {
              :boolean,
              []
            },
            discriminator: {
              OpenAPI.V3.Discriminator,
              []
            },
            read_only: {
              :boolean,
              []
            },
            write_only: {
              :boolean,
              []
            },
            xml: {
              OpenAPI.V3.XML,
              []
            },
            external_docs: {
              OpenAPI.V3.ExternalDocumentation,
              []
            },
            example: {
              :any,
              []
            },
            deprecated: {
              :boolean,
              []
            }
end
