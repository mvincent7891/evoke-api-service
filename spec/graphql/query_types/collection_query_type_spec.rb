RSpec.describe QueryTypes::CollectionQueryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance
  # create fake collections using the collection factory
  let!(:collections) { create_list(:collection, 3) }
  
  describe 'querying all collections' do

    it 'has a :collections that returns a Collection type' do
      expect(subject).to have_field(:collections).that_returns(types[Types::CollectionType])
    end

    it 'returns all our created collections' do
      query_result = subject.fields['collections'].resolve(nil, nil, nil)

      # ensure that each of our collections is returned
      collections.each do |collection|
        expect(query_result.to_a).to include(collection)
      end

      # we can also check that the number of collections returned is the one we created.
      expect(query_result.count).to eq(collections.count)
    end
  end

  describe 'query a specific collection using it\'s id' do

    it 'has a :collection that returns a Collection type' do
      expect(subject).to have_field(:collection).that_returns(Types::CollectionType)
    end

    it 'returns the queried  collection' do
      collection = Collection.first
      args = { id: collection.id }
      query_result = subject.fields['collection'].resolve(nil, args, nil)
      expect(query_result).to eq(collection)
    end
  end
end