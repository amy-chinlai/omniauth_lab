class CreateCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_tables do |t|
      t.string :name
    end
  end
end
