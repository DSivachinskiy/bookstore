class DropTable < ActiveRecord::Migration
  def change
 def down
    drop_table :order_statuses
  end
  end
end
