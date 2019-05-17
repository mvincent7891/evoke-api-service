class Definition < ApplicationRecord
    has_many :entries, as: :item

    def item_type
        'Definition'
    end
end
