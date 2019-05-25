module Mutations
  DefinitionMutation = GraphQL::ObjectType.define do
    name 'DefinitionMutation'
    description 'Mutation type for definition'

    field :create_definition, Types::DefinitionType do
      argument :term, !types.String
      argument :definition, !types.String
      argument :collectionId, !types.Int
      argument :source, !types.String
      argument :lexical_category, !types.String

      resolve ->(_obj, args, _ctx) do
        definition = Definition.create({
          term: args[:term],
          definition: args[:definition],
          lexical_category: args[:lexical_category],
          source: args[:source]
        })

        if args[:collectionId]
          collection = Collection.find(args[:collectionId])
          definition.entries.create(collection: collection)
        end

        definition
      end
    end
  end
end