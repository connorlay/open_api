defmodule OpenAPI.V3.Schema do
  @moduledoc """
  The Schema Object allows the definition of input and output data types. These types can be objects, but also primitives and arrays. This object is an extended subset of the JSON Schema Specification Wright Draft 00.
  """

  use OpenAPI.Object

  defobject [
    # JSON Schema
    {:title, :string, []},
    {:multiple_of, :integer, []},
    {:maximum, :integer, []},
    {:exclusive_maximum, :boolean, []},
    {:minimum, :integer, []},
    {:exclusive_minimum, :boolean, []},
    {:max_length, :integer, []},
    {:min_length, :integer, []},
    {:pattern, :string, []},
    {:max_items, :integer, []},
    {:min_items, :integer, []},
    {:unique_items, :boolean, []},
    {:max_properties, :integer, []},
    {:min_properties, :integer, []},
    {:required, [:string], []},
    {:enum, [:any], []},
    {:type, :string, []},
    {:all_of, [{OpenAPI.V3.Reference, __MODULE__}], []},
    {:one_of, [{OpenAPI.V3.Reference, __MODULE__}], []},
    {:any_of, [{OpenAPI.V3.Reference, __MODULE__}], []},
    {:not, __MODULE__, []},
    {:items, {OpenAPI.V3.Reference, __MODULE__}, []},
    {:properties, %{string: {OpenAPI.V3.Reference, __MODULE__}}, []},
    {:additional_properties, {:boolean, {OpenAPI.V3.Reference, __MODULE__}}, []},
    {:description, :string, []},
    {:format, :string, []},
    {:default, :any, []},
    # Open API Schema
    {:nullable, :boolean, []},
    {:descriminator, OpenAPI.V3.Discriminator, []},
    {:read_only, :boolean, []},
    {:write_only, :boolean, []},
    {:xml, OpenAPI.V3.XML, []},
    {:external_docs, OpenAPI.V3.ExternalDocumentation, []},
    {:example, :any, []},
    {:deprecated, :boolean, []}
  ]
end
