RSpec.describe Mutations::DefinitionMutation do
  describe 'creating a new record' do
    let(:attributes) do
      {
        title: 'A test title'
      }
    end
  
    let(:collection) { create(:collection, **attributes) }

    let(:args) do
      {
        term: 'test',
        definition: 'a thing you create before you code',
        collection_id: collection.id,
        lexical_category: 'noun',
        source: 'user'
      }
    end

    it 'increases definitions by 1' do
      # adds one definition to the db
      expect do 
        subject.fields['create_definition'].resolve(nil, args, nil)
      end.to change { Definition.count }.by 1
    end

    it 'increases entries by 1' do
      # adds one entry to the db
      expect do 
        subject.fields['create_definition'].resolve(nil, args, nil)
      end.to change { Entry.count }.by 1
    end

    it 'does not require collection_id' do
      new_args = {**args}
      new_args.delete(:collection_id)

      expect do 
        subject.fields['create_definition'].resolve(nil, new_args, nil)
      end.to change { Definition.count }.by 1
    end

    describe 'duplicate entries' do
      it 'does not create duplicate entries or definitions' do
        subject.fields['create_definition'].resolve(nil, args, nil)
  
        
        expect do 
          subject.fields['create_definition'].resolve(nil, args, nil)
        end.to change { Entry.count }.by 0
  
        expect do 
          subject.fields['create_definition'].resolve(nil, args, nil)
        end.to change { Definition.count }.by 0
      end
    end
  end
end