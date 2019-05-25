class Definition < ApplicationRecord
    validates :term, presence: true

    has_many :entries, as: :item
    has_many :synonyms
    # has_many :antonyms

    def item_type
        'Definition'
    end

    # add enum for souce
end
