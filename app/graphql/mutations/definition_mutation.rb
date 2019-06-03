module Mutations
  DefinitionMutation = GraphQL::ObjectType.define do
    name 'DefinitionMutation'
    description 'Mutation type for definition'

    field :create_definition, Types::DefinitionType do
      argument :term, !types.String
      argument :definition, !types.String
      argument :collection_id, types.Int
      argument :source, !types.String
      argument :lexical_category, !types.String

      resolve ->(_obj, args, _ctx) do
        definition = DefinitionService.create_definition(args)
      end
    end

    field :create_many_definitions, types[Types::DefinitionType] do
      argument :definitions, types[Types::DefinitionInputType]

      resolve ->(_obj, args, _ctx) do
        definition = DefinitionService.create_many_definitions(args)
      end
    end
  end
end