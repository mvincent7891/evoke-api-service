module Types
  CollectionType = GraphQL::ObjectType.define do
    name 'CollectionType'
    description 'The Collection type'

    field :id, !types.ID
    field :title, !types.String
  end
end
