require 'httparty'

module DictionaryService
  class << self
    def config
      {
        app_key: ENV["OXFORD_APPLICATION_KEY"],
        app_id: ENV["OXFORD_APPLICATION_ID"],
        url: ENV["OXFORD_API_BASE_URL"],
        language_code: 'en' 
      }
    end

    def _get(url)
      headers = {
        app_id: config[:app_id],
        app_key: config[:app_key]
      }
      
      puts "Making GET request to #{url}"
      response = HTTParty.get(url, headers: headers)
    end

    def lookup_entry(params)
      term = params[:term]
      should_create_definition = params[:create]

      url = "#{config[:url]}/entries/#{config[:language_code]}/#{term}?fields=definitions"
      response = _get(url)

      entries = []

      if response.code == 200
        response["results"].each do |result|
          result["lexicalEntries"].each do |lexical_entry|
            lexical_entry["entries"].each do |entry|
              entry["senses"].each do |sense|
                sense["definitions"].each do |definition|

                  entry_attributes = {
                    source: 'oxford',
                    lexical_category: lexical_entry["lexicalCategory"]["id"],
                    definition: definition,
                    term: result["id"]
                  }
                  entries.push(entry_attributes)

                  if should_create_definition
                    DefinitionService.create_definition(entry_attributes)
                  end

                end
              end
            end
          end
        end
      end
    
      entries
    end

    def lookup_similar(params)
      should_create_similar = params[:create]
      term = params[:term]

      entries = {synonyms: {}, antonyms: {}}

      url = "#{config[:url]}/thesaurus/#{config[:language_code]}/#{term}"
      response = _get(url)

      if response.code == 200
        response["results"].each do |result|
          result["lexicalEntries"].each do |lexical_entry|
            lexical_entry["entries"].each do |entry|
              entry["senses"].each do |sense|

                synoyms = sense["synonyms"] || []
                antonyms = sense["antonyms"] || []

                synoyms.each do |synonym|
                  synonym_key = synonym["id"]&.gsub!('_', ' ') || synonym["text"]
                  entries[:synonyms][synonym_key] = [term, synonym_key]
                end

                antonyms.each do |antonym|
                  antonym_key = antonym["id"]&.gsub!('_', ' ') || antonym["text"]
                  entries[:antonyms][antonym_key] = [term, antonym_key]
                end

              end
            end
          end
        end
      end
      
      if should_create_similar
        columns = [:term, :synonym]
        Synonym.import columns, entries[:synonyms].values

        columns = [:term, :antonym]
        Antonym.import columns, entries[:antonyms].values
      end

      entries[:antonyms].count + entries[:synonyms].count
    end
  end
end