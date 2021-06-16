class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.date :time_checkin
      t.date :time_checkout
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
