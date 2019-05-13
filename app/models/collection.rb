class Collection < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many :entries, dependent: :destroy
end
