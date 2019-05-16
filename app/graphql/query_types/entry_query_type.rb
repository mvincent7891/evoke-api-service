module QueryTypes
  EntryQueryType = GraphQL::ObjectType.define do
    name 'EntryQueryType'
    description 'The entry query type'

    field :entries, types[Types::EntryType], 'returns all entries' do
      resolve ->(_obj, _args, _ctx) { Entry.all }
    end

    field :entry, Types::EntryType, 'returns queried entry' do
      argument :id, !types.ID
    
      resolve ->(_obj, args, _ctx) { Entry.find_by!(id: args[:id]) }
    end
  end
end