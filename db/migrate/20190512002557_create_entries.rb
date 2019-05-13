class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :collection, foreign_key: true
      t.belongs_to :item, polymorphic: true

      t.timestamps
    end
  end
end
