class Coupon < ActiveRecord::Base

  validates :number, presence: true, uniqueness: true
end
