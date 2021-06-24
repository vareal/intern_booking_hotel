class AddColumnOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :code, :integer, null: false
  end
end
