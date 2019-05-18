module Mutations
  DefinitionMutation = GraphQL::ObjectType.define do
    name 'DefinitionMutation'
    description 'Mutation type for definition'

    field :create_definition, Types::DefinitionType do
      argument :term, !types.String
      argument :definition, !types.String
      argument :source, !types.String

      resolve ->(_obj, args, _ctx) do
        Definition.create({
          term: args[:term],
          definition: args[:definition]
        })
      end
    end
  end
end