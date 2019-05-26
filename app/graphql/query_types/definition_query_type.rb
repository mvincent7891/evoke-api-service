module QueryTypes
  DefinitionQueryType = GraphQL::ObjectType.define do
    name 'DefintionQueryType'
    description 'The Definitions query type'

    field :lookup, types[Types::DefinitionHashType], 'returns definitions for queried term' do
      argument :term, !types.String
    
      resolve ->(_obj, args, _ctx) { 
        params = {
          term: args[:term],
          should_create_definition: false
        }

        DictionaryService.lookup_entry(params).map do |definition|
          OpenStruct.new(**definition)
        end
      }
    end
  end
end