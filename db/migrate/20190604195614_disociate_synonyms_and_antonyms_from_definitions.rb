class DisociateSynonymsAndAntonymsFromDefinitions < ActiveRecord::Migration[5.2]
  def change
    remove_column :synonyms, :definition_id
    add_column :synonyms, :term, :string
    add_index :synonyms, :term

    remove_column :antonyms, :definition_id
    add_column :antonyms, :term, :string
    add_index :antonyms, :term
  end
end
