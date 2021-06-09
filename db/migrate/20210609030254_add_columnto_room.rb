class AddColumntoRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :city_id, :integer
  end
end
