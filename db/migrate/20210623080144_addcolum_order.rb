class AddcolumOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :coin_using, :integer
  end
end
