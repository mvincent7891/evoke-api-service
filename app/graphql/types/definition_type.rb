module Types
  DefinitionType = GraphQL::ObjectType.define do
    name 'DefinitionType'
    description 'The Definition type'

    field :id, !types.ID
    field :term, !types.String
    field :definition, !types.String
    field :lexical_category, !types.String
    field :source, !types.String
    field :item_type, !types.String
    field :hashed_def, !types.String
    field :synonyms, types[Types::SynonymType], 'return definition synonyms' do    
      resolve ->(_obj, args, _ctx) { _obj.synonyms }
    end
    field :antonyms, types[Types::AntonymType], 'return definition antonyms' do    
      resolve ->(_obj, args, _ctx) { _obj.antonyms }
    end
  end

  DefinitionHashType = GraphQL::ObjectType.define do
    name 'DefinitionHashType'
    description 'The Definition hash type'
    field :term, !types.String
    field :definition, !types.String
    field :lexical_category, !types.String
    field :source, !types.String
    field :hashed_def, types.String
    field :collection_ids, types[types.Int]
  end
end
