class AddBelongToUserToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :user_id, :integer
  end
end
