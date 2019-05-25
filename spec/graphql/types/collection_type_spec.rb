RSpec.describe Types::CollectionType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it 'has a :title field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:title).that_returns(!types.String)
  end

  it 'has a :entries field of [Types::EntryType] types' do
    # Ensure the field is of [Types::EntryType] type
    expect(subject).to have_field(:entries).that_returns([Types::EntryType])
  end
end