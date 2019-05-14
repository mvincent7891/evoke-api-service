module QueryTypes
  CollectionQueryType = GraphQL::ObjectType.define do
    name 'CollectionQueryType'
    description 'The collection query type'

    field :collections, types[Types::CollectionType], 'returns all collections' do
      resolve ->(_obj, _args, _ctx) { Collection.all }
    end
  end
end