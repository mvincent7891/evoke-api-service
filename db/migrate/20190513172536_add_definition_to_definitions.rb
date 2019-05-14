class AddDefinitionToDefinitions < ActiveRecord::Migration[5.2]
  def change
    add_column :definitions, :definition, :text
  end
end
