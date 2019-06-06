module Types
  CreateSimilarResponseType = GraphQL::ObjectType.define do
    name 'CreateSimilarResponseType'
    description 'The response type for creating synonyms and antonyms'

    field :count, !types.Int
    field :term, !types.String
  end
end
