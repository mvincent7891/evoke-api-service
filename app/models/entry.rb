class Entry < ApplicationRecord
  validates :collection, presence: true

  belongs_to :collection
  belongs_to :item, polymorphic: true

  def definition
    if self.item_type == 'Definition'
      self.item
    end
  end
end
