class Synonym < ApplicationRecord
  validates :synonym, uniqueness: { scope: :term }
end
