module DefinitionService
  class << self

    def create_many_definitions(params)
      params[:definitions].map do |definition|
        create_definition(definition)
      end
    end

    def create_definition(params)
      term = params[:term].strip.downcase
      definition = params[:definition].strip
      lex_cat = params[:lexical_category]
      source = params[:source]
      collection_ids = params[:collection_ids]

      # create the definition
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

      # add entries to collections
      if collection_ids
        collections = Collection.find(collection_ids)
      else
        collections = [Collection.find_by(title: 'Default')]
      end

      collections.each do |collection|
        definition.entries.find_or_create_by(collection: collection)
      end

      # add similar (synonyms and antonyms)
      synonyms_exist = Synonym.where(term: term).count > 0
      antonyms_exist = Antonym.where(term: term).count > 0
      if !(synonyms_exist || antonyms_exist)
        similar_count = DictionaryService.lookup_similar({
          term: term,
          create: true
        })
        puts "#{similar_count} synonyms / antonyms created."
      end
      
      definition
    end
  end
end
