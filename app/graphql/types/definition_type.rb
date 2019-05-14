module Types
  DefinitionType = GraphQL::ObjectType.define do
    name 'DefinitionType'
    description 'The Definition type'

    field :id, !types.ID
    field :term, !types.String
    field :definition, !types.String
  end
end