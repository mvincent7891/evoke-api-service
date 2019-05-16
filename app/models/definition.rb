class Definition < ApplicationRecord
    has_many :entries, as: :item
end
