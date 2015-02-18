class RemoveOrderItemIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :order_item_id, :integer
  end
end
