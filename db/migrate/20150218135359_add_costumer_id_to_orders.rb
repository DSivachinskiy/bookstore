class AddCostumerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :costumer_id, :integer
  end
end
