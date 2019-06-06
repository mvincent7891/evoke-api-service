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
  end

  describe 'has item type \'Definition\'' do
    it { expect(definition.item_type).to eq('Definition') }
  end
end