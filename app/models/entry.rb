class Entry < ApplicationRecord
  validates :collection, presence: true

  belongs_to :collection
  belongs_to :item, polymorphic: true

  attr_accessor :item_type
end
