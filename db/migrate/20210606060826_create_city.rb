class CreateCity < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :avatar
      t.string :name
    end

    add_index :cities, :name, unique: true
  end
end
