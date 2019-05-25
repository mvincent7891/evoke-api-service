class AddUniquenessToSynonyms < ActiveRecord::Migration[5.2]
  def change
    add_index :synonyms, [:definition_id, :synonym_id], unique: true
  end
end
