RSpec.describe Types::SynonymType do
  # avail type definer in our tests
  types = GraphQL::Define::TypeDefiner.instance

  it 'has an :id field of ID type' do
    # Ensure that the field id is of type ID
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it 'has an :definition attr of Definition type' do
    # Ensure the field is of Definition type
    expect(subject).to have_field(:definition).that_returns(Types::DefinitionType)
  end

  it 'has an :origin attr of Definition type' do
    # Ensure the field is of Definition type
    expect(subject).to have_field(:origin).that_returns(Types::DefinitionType)
  end

  it 'has a :synonym field of String type' do
    # Ensure the field is of String type
    expect(subject).to have_field(:synonym).that_returns(!types.String)
  end
end