class AddDefaultValueToStatus < ActiveRecord::Migration[6.0]
  def up
    change_column :rooms, :status, :integer, default: 1
  end
end
