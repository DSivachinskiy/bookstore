class RemoveCountryFromBillingAdresses < ActiveRecord::Migration
  def change
    remove_column :billing_adresses, :country, :string
  end
end
