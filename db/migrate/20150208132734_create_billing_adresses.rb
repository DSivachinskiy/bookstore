class CreateBillingAdresses < ActiveRecord::Migration
  def change
    create_table :billing_adresses do |t|
      t.string :adress
      t.integer :zipcode
      t.string :city
      t.string :phone
      t.string :country

      t.timestamps
    end
  end
end
