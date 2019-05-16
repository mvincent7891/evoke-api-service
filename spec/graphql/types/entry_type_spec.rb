RSpec.describe Types::EntryType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it 'has an :definition field of Definition type' do
    # Ensure that the field definition is of type Definition
    expect(subject).to have_field(:definition).that_returns(Types::DefinitionType)
  end
end