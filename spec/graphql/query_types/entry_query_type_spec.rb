RSpec.describe QueryTypes::EntryQueryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance
  # create fake entries using the entry factory
  let!(:entries) { 
    collection = create(:collection, title: 'Test Collection')
    definitions = create_list(:definition, 3)

    definitions.each do |definition|
      definition.entries.create(collection: collection)
    end

    Entry.all
  }
  
  describe 'querying all entries' do

    it 'has a :entries that returns a EntryType' do
      expect(subject).to have_field(:entries).that_returns(types[Types::EntryType])
    end

    it 'returns all our created entries' do
      query_result = subject.fields['entries'].resolve(nil, nil, nil)

      # ensure that each of our entries is returned
      entries.each do |entry|
        expect(query_result.to_a).to include(entry)
      end

      # we can also check that the number of entries returned is the one we created.
      expect(query_result.count).to eq(entries.count)
    end
  end

  describe 'querying an entry' do

    it 'has a :entry that returns an Entry type' do
      expect(subject).to have_field(:entry).that_returns(Types::EntryType)
    end

    it 'returns an entry by id' do
      entry = Entry.first
      args = { id: entry.id }
      query_result = subject.fields['entry'].resolve(nil, args, nil)
      expect(query_result).to eq(entry)
    end
  end
end