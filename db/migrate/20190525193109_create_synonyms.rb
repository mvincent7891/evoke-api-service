class CreateSynonyms < ActiveRecord::Migration[5.2]
  def change
    create_table :synonyms do |t|
      t.integer :definition_id
      t.integer :synonym_id

      t.timestamps
    end
    add_index :synonyms, :definition_id
    add_index :synonyms, :synonym_id
  end
end
