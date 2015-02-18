class AddOrderItemIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :order_item_id, :integer
  end
end
