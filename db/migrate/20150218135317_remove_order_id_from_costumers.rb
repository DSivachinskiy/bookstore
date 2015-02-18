class RemoveOrderIdFromCostumers < ActiveRecord::Migration
  def change
    remove_column :costumers, :order_id, :integer
  end
end
