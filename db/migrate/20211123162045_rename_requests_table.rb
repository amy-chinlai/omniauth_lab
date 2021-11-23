class RenameRequestsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :requests_tables, :requests
  end
end
