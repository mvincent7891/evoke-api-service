RSpec.describe QueryTypes::KeywordsQueryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance
  # create fake synonyms, antonyms and entries
  let!(:synonyms) { create_list(:synonym, 3) }
  let!(:antonyms) { create_list(:antonym, 3) }
  let!(:collection) { create(:collection, title: 'Test') }
  


  let!(:entries) {
    entries = []
    entries += synonyms.map do |synonym| 
      definition = create(:definition, term: synonym.term)
      definition.entries.create(collection: collection) 
    end

    entries += antonyms.map do |antonym| 
      definition = create(:definition, term: antonym.term)
      definition.entries.create(collection: collection) 
    end

    entries
  }

  describe 'querying all keywords' do

    it 'has a :keywords that returns a [Types::KeywordHashType] type' do
      expect(subject).to have_field(:keywords).that_returns(types[Types::KeywordHashType])
    end

    it 'returns all our created entries, synonyms, and antonyms' do
      query_result = subject.fields['keywords'].resolve(nil, nil, nil)
      expect(query_result.size).to eq(Entry.count + Antonym.count + Synonym.count)
    end
  end
end