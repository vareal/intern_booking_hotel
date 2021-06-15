class AddColumntoRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :capacity_adult_person, :integer
    add_column :rooms, :capacity_child_person, :integer
  end
end
