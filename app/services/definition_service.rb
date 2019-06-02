module DefinitionService
  class << self

    def create_many_definitions(params)
      params[:definitions].each do |definition|
        create_definition(definition)
      end
    end

    def create_definition(params)
      term = params[:term].strip.downcase
      definition = params[:definition].strip
      lex_cat = params[:lexical_category]
      source = params[:source]
      collection_ids = params[:collection_ids]

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

      if collection_ids
        collections = Collection.find(collection_ids)
      else
        collections = [Collection.find_by(title: 'Default')]
      end

      collections.each do |collection|
        definition.entries.find_or_create_by(collection: collection)
      end
      
      definition
    end
  end
end
