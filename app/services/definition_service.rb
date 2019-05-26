module DefinitionService
  class << self
    def create_definition(params)
      term = params[:term].strip.downcase
      definition = params[:definition].strip
      lex_cat = params[:lexical_category]
      source = params[:source]
      collection_id = params[:collection_id]

      definition = Definition.create({
          term: term,
          definition: definition,
          lexical_category: lex_cat,
          source: source
        })
         
      if definition.errors.details.has_key?(:hashed_def)
        # Definition is already created for term, definition, source, lexical_category combination
        # LOGGER.info("Found existing definition for term, definition, source, lexical_category combination; skipping creation.")
        extant_definition = Definition.find_by(hashed_def: definition.hashed_def)
        definition = extant_definition
      end

      if collection_id
        collection = Collection.find(collection_id)
      else
        collection = Collection.find_by(title: 'Default')
      end

      definition.entries.find_or_create_by(collection: collection)
      
      definition
    end
  end
end
