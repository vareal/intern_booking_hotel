class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
