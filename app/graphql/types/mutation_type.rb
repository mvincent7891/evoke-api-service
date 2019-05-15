module Types
  # class MutationType < Types::BaseObject
  #   # TODO: remove me
  #   field :test_field, String, null: false,
  #     description: "An example field added by the generator"
  #   def test_field
  #     "Hello World"
  #   end
  # end

  MutationType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'Mutation'
    root_type.description = 'The mutation root'
    root_type.interfaces = []
    root_type.fields = Util::FieldCombiner.combine([])
  end
end
