RSpec.describe DictionaryService do
  skip 'calls lookup_entry' do
    params = {term: 'example'}
    entries = DictionaryService.lookup_entry(params)
    expect(entries.count).to eq 3

    # should not create definitions
    expect(Definition.count).to eq 0
  end

  skip 'adds definitions if :create is true' do
    params = {term: 'example', create: true}
    expect do
      DictionaryService.lookup_entry(params)
    end.to change { Definition.count }.by 3
  end

  skip 'calls lookup_similar' do
    params = {term: 'review', create: true}

    entries = DictionaryService.lookup_similar(params)

    expect(entries.empty?).to eq false
  end
end
