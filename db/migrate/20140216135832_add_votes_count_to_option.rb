class AddVotesCountToOption < ActiveRecord::Migration
  def change
    add_column :options, :votes_count, :integer, default: 0
  end
end
