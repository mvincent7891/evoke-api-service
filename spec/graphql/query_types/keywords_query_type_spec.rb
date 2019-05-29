RSpec.describe QueryTypes::KeywordsQueryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance
  # create fake synonyms, antonyms and entries
  let!(:synonyms) { create_list(:synonym, 3) }
  let!(:antonyms) { create_list(:antonym, 3) }
  let!(:collection) { create(:collection, title: 'Test') }
  
  let!(:entries) {
    synonyms.each { |synonym| synonym.definition.entries.create(collection: collection) }
    antonyms.each { |antonym| antonym.definition.entries.create(collection: collection) }
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