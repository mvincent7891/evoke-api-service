module Types
  EntryType = GraphQL::ObjectType.define do
    name 'EntryType'
    description 'The Entry type'

    field :id, !types.ID
    # field :collection, !types.String
  end
end