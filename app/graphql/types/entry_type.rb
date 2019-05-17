module Types
  EntryType = GraphQL::ObjectType.define do
    name 'EntryType'
    description 'The Entry type'

    field :id, !types.ID
    field :collection, Types::CollectionType do
      resolve ->(_obj, _args, _ctx) { _obj.collection }
    end

    field :definition, Types::DefinitionType do
      resolve ->(_obj, _args, _ctx) do
        _obj.definition
      end
    end

    field :item, Types::ItemType do
      resolve ->(_obj, _args, _ctx) do
        _obj.item
      end
    end
  end
end