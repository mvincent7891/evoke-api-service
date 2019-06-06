RSpec.describe Antonym, type: :model do
  let(:antonym) do
      create(:antonym)
  end

  describe 'model validations' do
    # ensure that antonym and definition combinations are unique
    it { expect(antonym).to validate_uniqueness_of(:antonym).scoped_to(:term) }
  end
end