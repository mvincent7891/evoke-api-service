class AddHashedDefToDefinition < ActiveRecord::Migration[5.2]
  def change
    add_column :definitions, :hashed_def, :string
  end
end
