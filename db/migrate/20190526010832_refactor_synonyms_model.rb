class RefactorSynonymsModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :synonyms, :synonym_id
    add_column :synonyms, :synonym, :string
  end
end
