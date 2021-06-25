class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :coin
      t.integer :user_id
      t.integer :order_id, unique: true
    end

    add_index :wallets, :order_id, unique: true
  end
end
