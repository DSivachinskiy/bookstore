class AddAdressIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :adress_id, :integer
  end
end
