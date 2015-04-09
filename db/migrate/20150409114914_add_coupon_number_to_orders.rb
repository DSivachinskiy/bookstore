class AddCouponNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :coupon_number, :integer
  end
end
