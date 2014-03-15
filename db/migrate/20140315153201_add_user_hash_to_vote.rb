class AddUserHashToVote < ActiveRecord::Migration
  def change
    add_column :votes, :user_hash, :text
  end
end
