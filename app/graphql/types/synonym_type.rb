module Types
  SynonymType = GraphQL::ObjectType.define do
    name 'SynonymType'
    description 'The Synonym type'

    field :id, !types.ID
    field :synonym, !types.String
    field :origin, Types::DefinitionType
    field :definition, Types::DefinitionType
  end
end
