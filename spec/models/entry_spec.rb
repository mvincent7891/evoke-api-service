RSpec.describe Entry, type: :model do
    let(:collection) { create(:collection) }
    let(:attributes) do
      {
        collection: collection
      }
    end
    let(:definition_attributes) do
      {
        term: 'entropy'
      }
    end
  
    let(:entry) do
        definition = create(:definition, **definition_attributes)
        definition.entries.create(collection: collection)
    end
  
    describe 'model validations' do
      # ensure that the title field is never empty
      it { expect(entry).to validate_presence_of(:collection) }
    end
  
    describe 'model associations' do
      it { expect(entry).to belong_to(:collection) }
    end

    describe 'dependent destruction' do 
      it 'is destroyed when the associated item is destroyed' do 
        entry
        expect do 
          Definition.last.destroy
        end.to change { Entry.count }.by -1
      end
    end
  end