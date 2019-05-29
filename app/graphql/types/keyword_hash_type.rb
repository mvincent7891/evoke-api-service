module Types
  KeywordHashType = GraphQL::ObjectType.define do
    name 'KeywordHashType'
    description 'The Keyword hash type'

    field :keyword, types.String
    field :keyword_id, types.ID
    field :keyword_type, types.String
    field :related, types.String
    field :related_id, types.ID
    field :related_type, types.String
  end
end