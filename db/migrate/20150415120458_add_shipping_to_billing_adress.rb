class AddShippingToBillingAdress < ActiveRecord::Migration
  def change
    add_column :billing_adresses, :shipping, :boolean
  end
end
