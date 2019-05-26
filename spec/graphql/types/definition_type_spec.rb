RSpec.describe Types::DefinitionType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it 'has a :term field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:term).that_returns(!types.String)
  end

  it 'has a :definition field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:definition).that_returns(!types.String)
  end

  it 'has a :item_type field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:item_type).that_returns(!types.String)
  end

  it 'has a :synonyms field of [Types::SynonymType] types' do
    # Ensure the field is of [Types::SynonymType] type
    expect(subject).to have_field(:synonyms).that_returns([Types::SynonymType])
  end

  it 'has a :hashed_def field of String types' do
    # Ensure the field is of [Types::SynonymType] type
    expect(subject).to have_field(:hashed_def).that_returns(!types.String)
  end
end