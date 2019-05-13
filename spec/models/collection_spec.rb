RSpec.describe Collection, type: :model do
    it 'has a valid factory' do
      # Check that the factory we created is valid
      expect(build(:collection)).to be_valid
    end
  
    let(:attributes) do
      {
        title: 'A test title'
      }
    end
  
    let(:collection) { create(:collection, **attributes) }
  
    describe 'model validations' do
      # check that the title field received the right values
      it { expect(collection).to allow_value(attributes[:title]).for(:title) }
      # ensure that the title field is never empty
      it { expect(collection).to validate_presence_of(:title) }
      # ensure that the title is unique for each collection
      it { expect(collection).to validate_uniqueness_of(:title)}
    end
  
    describe 'model associations' do
      # ensure a collection has many items
      it { expect(collection).to have_many(:entries) }
    end
  end