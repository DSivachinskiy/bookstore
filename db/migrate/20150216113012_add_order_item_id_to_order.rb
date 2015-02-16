class AddOrderItemIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_item_id, :integer
  end
end
