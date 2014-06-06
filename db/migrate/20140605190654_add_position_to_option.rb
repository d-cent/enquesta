class AddPositionToOption < ActiveRecord::Migration
  def change
    add_column :options, :position, :integer
  end
end
