class AddTimeZoneToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :time_zone, :string
  end
end
