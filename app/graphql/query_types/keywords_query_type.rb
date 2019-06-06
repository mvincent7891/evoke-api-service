module QueryTypes
  KeywordsQueryType = GraphQL::ObjectType.define do
    name 'KeywordsQueryType'
    description 'The keywords query type'

    field :keywords, types[Types::KeywordHashType], 'returns all keywords (entries, synonyms, and antonyms)' do
      resolve ->(_obj, _args, _ctx) { 
        keywords = []
        keywords.concat(Antonym.all.map do |antonym|
          OpenStruct.new(
            keyword: antonym.antonym, 
            keyword_id: antonym.id, 
            keyword_type: 'Antonym', 
            related: antonym.term,
            related_type: 'Definition'
          )
        end)

        keywords.concat(Synonym.all.map do |synonym|
          OpenStruct.new(
            keyword: synonym.synonym, 
            keyword_id: synonym.id, 
            keyword_type: 'Synonym', 
            related: synonym.term,
            related_type: 'Definition'
          )
        end)

        keywords.concat(Entry.includes([:item, :collection]).all.map do |entry|
          OpenStruct.new(
            keyword: entry.item.term, 
            keyword_id: entry.item.id, 
            keyword_type: 'Definition', 
            related: entry.collection.title,
            related_id: entry.collection.id, 
            related_type: 'Collection', 
          )
        end)

        keywords
      }
    end
  end
end