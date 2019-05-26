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

        definitions_by_hashed_def = {}
        # TODO move to DictionaryService or DefinitionService
        DictionaryService.lookup_entry(params).map do |definition|
          hashed_def = Definition.build_hashed_def(
            _term: definition[:term],
            _definition: definition[:definition],
            _source: definition[:source],
            _lexical_category: definition[:lexical_category]
          )

          definition[:hashed_def] = hashed_def
          definition[:collections] = []
          definitions_by_hashed_def[hashed_def] = OpenStruct.new(**definition)       
        end

        existing_definitions = Definition.where(hashed_def: definitions_by_hashed_def.keys)
        # TODO cleanup access to limit db hits 
        existing_definitions.each do |exdef|
          collections = exdef.entries.map { |entry| entry.collection.id }
          definitions_by_hashed_def[exdef.hashed_def][:collections] = collections
        end

        definitions_by_hashed_def.values
      }
    end
  end
end