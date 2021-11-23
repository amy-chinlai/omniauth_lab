class CreateRequestsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :requests_tables do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :creator_id
    end
  end
end
