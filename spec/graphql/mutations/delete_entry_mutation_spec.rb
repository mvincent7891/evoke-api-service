RSpec.describe Mutations::DeleteEntryMutation do
  describe 'deleting an entry' do  
    let(:entry) { create(:entry) }

    it 'removes an entry' do
      expect do 
        entry
      end.to change { Entry.count }.by 1
      
      args = {
        id: entry.id
      }

      expect do 
        subject.fields['delete_entry'].resolve(nil, args, nil)
      end.to change { Entry.count }.by -1
    end
  end
end