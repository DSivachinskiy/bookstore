class OrderItem < ActiveRecord::Base

belongs_to :book
belongs_to :order



validates :quantity, presence: true
before_save :save_price
after_save :save_order_price
after_destroy :save_order_price

def calculate
 bprice = book.price
 bprice*quantity
end


def save_price
  self.price = calculate
end

def save_order_price
self.order.save_price
self.order.save
end

end
