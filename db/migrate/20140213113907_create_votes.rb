class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :option_id

      t.timestamps
    end
  end
end
