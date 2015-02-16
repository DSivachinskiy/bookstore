class AddBookIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :book_id, :integer
  end
end
