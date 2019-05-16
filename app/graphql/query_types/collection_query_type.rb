module QueryTypes
  CollectionQueryType = GraphQL::ObjectType.define do
    name 'CollectionQueryType'
    description 'The collection query type'

    field :collections, types[Types::CollectionType], 'returns all collections' do
      resolve ->(_obj, _args, _ctx) { Collection.all }
    end

    field :collection, Types::CollectionType, 'returns a collection by ID' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { Collection.find(args.id) }
    end
  end
end