class AddOrderIdToAdresses < ActiveRecord::Migration
  def change
    add_column :adresses, :order_id, :integer
  end
end
