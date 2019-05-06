defmodule OpenAPI.V3.Discriminator do
  @moduledoc """
  When request bodies or response payloads may be one of a number of different schemas, a discriminator object can be used to aid in serialization, deserialization, and validation. The discriminator is a specific object in a schema which is used to inform the consumer of the specification of an alternative schema based on the value associated with it.

  When using the discriminator, inline schemas will not be considered.
  """

  use OpenAPI.Object

  defobject property_name: {
              :string,
              []
            },
            mapping: {
              {:map, [:string, :string]},
              []
            }
end
