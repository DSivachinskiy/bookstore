class AddCountryIdToBillingAdresses < ActiveRecord::Migration
  def change
    add_column :billing_adresses, :country_id, :integer
  end
end
