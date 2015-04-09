class AddNumberToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :number, :integer
  end
end
