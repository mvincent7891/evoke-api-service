class Antonym < ApplicationRecord
  validates :antonym, uniqueness: { scope: :term }
end
