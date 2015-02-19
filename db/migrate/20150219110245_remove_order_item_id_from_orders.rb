class RemoveOrderItemIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :order_item_id, :integer
  end
end
