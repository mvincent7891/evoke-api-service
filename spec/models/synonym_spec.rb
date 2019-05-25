RSpec.describe Synonym, type: :model do
  let(:synonym) do
      create(:synonym)
  end

  describe 'model validations' do
    # ensure that synonym and definition combinations are unique
    it { expect(synonym).to validate_uniqueness_of(:synonym_id).scoped_to(:definition_id) }
  end

  describe 'model associations' do
    it { expect(synonym).to belong_to(:synonym) }
    it { expect(synonym).to belong_to(:definition) }
  end
end