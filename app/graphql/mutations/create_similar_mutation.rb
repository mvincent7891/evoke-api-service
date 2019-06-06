module Mutations
  CreateSimilarMutation = GraphQL::ObjectType.define do
    name 'CreateSimilarMutation'
    description 'Mutation type for creating synonyms and antonyms'

    field :create_similar, Types::CreateSimilarResponseType do
      argument :term, !types.String

      resolve ->(_obj, args, _ctx) do
        similar_count = DictionaryService.lookup_similar({
          term: args[:term],
          create: true
        })

        OpenStruct.new(
          count: similar_count,
          term: args[:term]
        )
      end
    end
  end
end