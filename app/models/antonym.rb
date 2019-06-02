class Antonym < ApplicationRecord
  validates :antonym, uniqueness: { scope: :definition_id }

  belongs_to :definition, foreign_key: "definition_id", dependent: :destroy

  alias_attribute :origin, :definition
end
