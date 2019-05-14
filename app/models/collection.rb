class Collection < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many :entries, dependent: :destroy
    has_many :definitions, through: :entries, source: :item, source_type: "Definition"
end
