class CreateVotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :votes_tables do |t|
      t.integer :user_id
      t.integer :request_id
      t.integer :vote_type
    end
  end
end
