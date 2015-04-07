class AddUpsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ups, :integer
  end
end
