class RemoveVotesCountFromOption < ActiveRecord::Migration
  def change
    remove_column :options, :votes_count, :integer
  end
end
