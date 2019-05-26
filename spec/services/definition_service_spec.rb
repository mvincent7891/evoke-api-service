RSpec.describe DefinitionService do
  describe 'calling create_definition' do

    let(:collection) { create(:collection, title: 'A test title') }
    let!(:default_collection) { create(:collection, title: 'Default') }

    let(:params) do
      {
        term: 'test',
        definition: 'a thing you create before you code',
        lexical_category: 'noun',
        source: 'user'
      }
    end

    it 'creates a definition' do 
      params[:collection_id] = collection.id
      expect do
        DefinitionService.create_definition(params)
      end.to change  {Definition.count }.by 1

      expect(Entry.count).to eq 1
    end


    it 'adds definition to Default collection by default' do 
      expect do
        DefinitionService.create_definition(params)
      end.to change  { Definition.count }.by 1

      expect(Entry.last.item.id).to eq(Definition.last.id)
      expect(Entry.last.collection.id).to eq(default_collection.id)
    end
  end
end
