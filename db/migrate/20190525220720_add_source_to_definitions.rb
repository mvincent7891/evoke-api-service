class AddSourceToDefinitions < ActiveRecord::Migration[5.2]
  def change
    add_column :definitions, :source, :integer
  end
end
