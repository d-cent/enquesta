class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :prompt
      t.text :hashed_id

      t.timestamps
    end
  end
end
