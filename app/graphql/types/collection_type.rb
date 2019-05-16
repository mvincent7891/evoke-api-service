module Types
  CollectionType = GraphQL::ObjectType.define do
    name 'CollectionType'
    description 'The Collection type'

    field :id, !types.ID
    field :title, !types.String
    field :entries, types[Types::EntryType], 'return collection entries' do    
      resolve ->(_obj, args, _ctx) { _obj.entries }
    end
  end
end
