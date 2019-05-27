RSpec.describe Antonym, type: :model do
  let(:antonym) do
      create(:antonym)
  end

  describe 'model validations' do
    # ensure that antonym and definition combinations are unique
    it { expect(antonym).to validate_uniqueness_of(:antonym).scoped_to(:definition_id) }
  end

  describe 'model associations' do
    it { expect(antonym).to belong_to(:definition) }
  end
end