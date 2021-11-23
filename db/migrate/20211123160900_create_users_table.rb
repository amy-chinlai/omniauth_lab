class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tables do |t|
      t.string :email
      t.string :organization
      t.string :password_digest
      t.boolean :admin
      t.string :name
      t.string :image
      t.string :uid
    end
  end
end
