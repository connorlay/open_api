defmodule OpenAPI.V3.Schema do
  @moduledoc """
  The Schema Object allows the definition of input and output data types. These types can be objects, but also primitives and arrays. This object is an extended subset of the JSON Schema Specification Wright Draft 00.
  """

  use OpenAPI.Object

  defobject(
    title: {
      :string,
      []
    },
    # JSON Schema fields
    multiple_of: {
      :integer,
      # must be > 0
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
      # must be >= 0
      #
      # for strings, count the number of characters
      []
    },
    min_length: {
      :integer,
      # must be >= 0
      #
      # for strings, count the number of characters
      []
    },
    pattern: {
      :string,
      # must be a valid regular ECMA 262 expression
      []
    },
    max_items: {
      :integer,
      # must be >= 0
      #
      # counts the items in an array
      []
    },
    min_items: {
      :integer,
      # must be >= 0
      #
      # counts the items in an array
      []
    },
    unique_items: {
      :boolean,
      []
    },
    max_properties: {
      :integer,
      # must be >= 0
      #
      # counts the number of properties
      []
    },
    min_properties: {
      :integer,
      # must be >= 0
      #
      # counts the number of properties
      []
    },
    required: {
      {:list, [:string]},
      # must have at least one element
      # must be unique elements
      []
    },
    enum: {
      {:list, [:any]},
      # must have at least one element
      # must be unique elements
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
      {:union, [__MODULE__, OpenAPI.V3.Reference]},
      []
    },
    items: {
      # must be present if schema.type == "array"
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
      # integer:
      # - int34
      # - int64
      #
      # number:
      # - float
      # - double
      #
      # string:
      # - byte
      # - binary
      # - date
      # - date-time
      # - password
      :string,
      []
    },
    default: {
      :any,
      # must pass validation for the schema or type defined at the same level
      []
    },
    nullable: {
      :boolean,
      []
    },
    discriminator: {
      OpenAPI.V3.Discriminator,
      []
    },
    read_only: {
      # relevant only for "properties" definitions
      #
      # cannot be marked both "readOnly" and "writeOnly"
      :boolean,
      []
    },
    write_only: {
      # relevant only for "properties" definitions
      #
      # cannot be marked both "readOnly" and "writeOnly"
      :boolean,
      []
    },
    xml: {
      # only applies to property schemas, not root schemas
      OpenAPI.V3.XML,
      []
    },
    external_docs: {
      OpenAPI.V3.ExternalDocumentation,
      []
    },
    example: {
      # can be literally anything
      :any,
      []
    },
    deprecated: {
      :boolean,
      []
    }
  )
end
