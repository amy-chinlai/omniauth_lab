class RenameVotesTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :votes_tables, :votes
  end
end
