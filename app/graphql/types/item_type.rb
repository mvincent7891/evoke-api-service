module Types
  ItemType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = 'ItemType'
    root_type.description = 'The Item polymorphic type'
    root_type.interfaces = []
    # Combine all polymorphic Item types
    root_type.fields = Util::FieldCombiner.combine([
      Types::DefinitionType
    ])
  end
end