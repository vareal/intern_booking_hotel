class AddColumnBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :capacity_adult, :integer
    add_column :orders, :capacity_child, :integer
  end
end
