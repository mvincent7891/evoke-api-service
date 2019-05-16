module Types
  EntryType = GraphQL::ObjectType.define do
    name 'EntryType'
    description 'The Entry type'

    field :id, !types.ID
    field :collection, Types::CollectionType do
      resolve ->(_obj, _args, _ctx) { _obj.collection }
    end

    # TODO change to :item
    field :definition, Types::DefinitionType do
      resolve ->(_obj, _args, _ctx) do
        puts '========='
        puts _obj.definition.term
        _obj.definition
      end
    end
  end
end