class Definition < ApplicationRecord
    before_validation :assign_hashed_def

    validates :term, presence: true
    validates :definition, presence: true
    validates :lexical_category, presence: true
    validates :hashed_def, uniqueness: true

    has_many :entries, as: :item, dependent: :destroy

    enum source: [:oxford, :user]

    def self.build_hashed_def(_term:, _definition:, _source:, _lexical_category:)
        # TODO: raise Exception / do something
        if [_term, _definition, _source, _lexical_category].any? &:blank?
            puts 'hashed_def taken for term, definition, source, lexical_category combination'
        end

        hash_input = "#{_term}::#{_definition}::#{_source}::#{_lexical_category}"
        Digest::SHA2.hexdigest hash_input
    end

    def item_type
        'Definition'
    end

    def synonyms
        Synonym.where(term: term)
    end

    def antonyms
        Antonym.where(term: term)
    end

    private
    def assign_hashed_def
        self.hashed_def = Definition.build_hashed_def(
            _term: term,
            _definition: definition,
            _source: source,
            _lexical_category: lexical_category
        )
    end
end
