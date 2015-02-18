class AddOrderIdToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :order_id, :integer
  end
end
