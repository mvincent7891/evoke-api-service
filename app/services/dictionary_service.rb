require 'httparty'

module DictionaryService
  class << self
    def config
      {
        app_key: ENV["OXFORD_APPLICATION_KEY"],
        app_id: ENV["OXFORD_APPLICATION_ID"],
        url: ENV["OXFORD_API_BASE_URL"],
        language_code: 'en-us' 
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
          result["lexicalEntries"].each do |lexicalEntry|
            lexicalEntry["entries"].each do |entry|
              entry["senses"].each do |sense|
                sense["definitions"].each do |definition|

                  entry_attributes = {
                    source: 'oxford',
                    lexical_category: lexicalEntry["lexicalCategory"]["id"],
                    definition: definition,
                    term: result["id"]
                  }
                  entries.push(entry_attributes)

                  if should_create_definition
                    Definition.create(**entry_attributes)
                  end
                end
              end
            end
          end
        end
      end
    
      entries
    end
  end
end