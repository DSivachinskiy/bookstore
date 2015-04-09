class Coupon < ActiveRecord::Base

  validates :number, presence: true
end
