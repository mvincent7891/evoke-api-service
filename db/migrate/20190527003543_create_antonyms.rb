class CreateAntonyms < ActiveRecord::Migration[5.2]
  def change
    create_table :antonyms do |t|
      t.integer :definition_id
      t.string :antonym

      t.timestamps
    end
    add_index :antonyms, :definition_id
  end
end
