module Types
  AntonymType = GraphQL::ObjectType.define do
    name 'AntonymType'
    description 'The Antonym type'

    field :id, !types.ID
    field :antonym, !types.String
    field :origin, Types::DefinitionType
    field :definition, Types::DefinitionType
  end
end
