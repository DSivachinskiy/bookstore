class AddCostumerIdToBillingAdresses < ActiveRecord::Migration
  def change
    add_column :billing_adresses, :costumer_id, :integer
  end
end
