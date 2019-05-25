RSpec.describe DictionaryService do
  it 'calls lookup_entry' do
    params = {term: 'example'}
    entries = DictionaryService.lookup_entry(params)
    expect(entries.count).to eq 3

    # should not create definitions
    expect(Definition.count).to eq 0
  end

  it 'adds definitions if :create is true' do
    params = {term: 'example', create: true}
    expect do
      DictionaryService.lookup_entry(params)
    end.to change { Definition.count }.by 3
  end
end
