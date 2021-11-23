class RenameCategoriesTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :categories_tables, :categories
  end
end
