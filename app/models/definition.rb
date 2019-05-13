class Definition < ApplicationRecord
    has_many :entries, as: :item

    attr_accessor :term
end
