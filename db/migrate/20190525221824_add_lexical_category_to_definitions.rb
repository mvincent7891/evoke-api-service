class AddLexicalCategoryToDefinitions < ActiveRecord::Migration[5.2]
  def change
    add_column :definitions, :lexical_category, :string
  end
end
