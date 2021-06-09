class CreateRoom < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :city_id

      t.timestamps
    end
  end
end
