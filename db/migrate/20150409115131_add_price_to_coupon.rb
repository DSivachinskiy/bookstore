class AddPriceToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :price, :integer
  end
end
