class RemoveBookIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :book_id, :integer
  end
end
