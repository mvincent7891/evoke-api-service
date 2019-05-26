class Definition < ApplicationRecord
    before_validation :build_hashed_def

    validates :term, presence: true
    validates :definition, presence: true
    validates :lexical_category, presence: true
    validates :hashed_def, uniqueness: true

    has_many :entries, as: :item, dependent: :destroy
    has_many :synonyms
    # has_many :antonyms

    enum source: [:oxford, :user]

    def item_type
        'Definition'
    end

    private
    def build_hashed_def
        hash_input = "#{term}::#{definition}::#{source}::#{lexical_category}"
        self.hashed_def = Digest::SHA2.hexdigest hash_input
    end
end
