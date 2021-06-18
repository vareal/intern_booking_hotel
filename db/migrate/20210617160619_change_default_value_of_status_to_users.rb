class ChangeDefaultValueOfStatusToUsers < ActiveRecord::Migration[6.0]
  def up
    change_column_default :rooms, :status, 2
  end
  def down
    change_column_default :rooms, :status, 1
  end
end
