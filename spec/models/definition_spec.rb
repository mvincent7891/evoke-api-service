RSpec.describe Definition, type: :model do
  let(:attributes) do
    {
      term: 'test',
      definition: 'test'
    }
  end

  let(:definition) do
      create(:definition, **attributes)
  end

  describe 'model validations' do
    # ensure that the term field is never empty
    it { expect(definition).to validate_presence_of(:term) }
  end

  describe 'model associations' do
    it { expect(definition).to have_many(:entries) }
    it { expect(definition).to have_many(:synonyms) }
  end

  describe 'has item type \'Definition\'' do
    it { expect(definition.item_type).to eq('Definition') }
  end

  describe 'synonyms' do 
    it 'has none initially' do
      expect(definition.synonyms).to eq([])
    end

    it 'creates synonyms' do
      synonym = create(:definition)
      definition.synonyms.create(synonym: synonym)

      expect(definition.synonyms.count).to eq(1)
    end
  end
end