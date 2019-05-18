module Types
  DefinitionType = GraphQL::ObjectType.define do
    name 'DefinitionType'
    description 'The Definition type'

    field :id, !types.ID
    field :term, !types.String
    field :definition, !types.String
    field :source, !types.String
    field :item_type, !types.String
  end
end
