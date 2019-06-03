module Types
  DefinitionInputType = GraphQL::InputObjectType.define do
    name 'DefinitionInputType'
    description 'The Definition input type'
    argument :term, !types.String
    argument :definition, !types.String
    argument :lexical_category, !types.String
    argument :source, !types.String
    argument :hashed_def, types.String
    argument :collection_ids, types[types.Int]
  end
end