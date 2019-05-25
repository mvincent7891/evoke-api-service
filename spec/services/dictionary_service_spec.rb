RSpec.describe DictionaryService do
  it 'calls lookup_entry' do
    params = {term: 'example'}
    expect(DictionaryService.lookup_entry(params)).to eq('ok')
  end
end
