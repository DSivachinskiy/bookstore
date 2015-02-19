class OrderStatus < ActiveRecord::Base
has_many :orders
validates :status, presence: true
end
