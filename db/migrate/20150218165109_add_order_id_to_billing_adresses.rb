class AddOrderIdToBillingAdresses < ActiveRecord::Migration
  def change
    add_column :billing_adresses, :order_id, :integer
  end
end
