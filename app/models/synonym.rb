class Synonym < ApplicationRecord
  validates :synonym_id, uniqueness: { scope: :definition_id }

  belongs_to :definition, foreign_key: "definition_id"
  belongs_to :synonym, class_name: 'Definition', foreign_key: "synonym_id"
end
