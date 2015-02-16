class Cart < ActiveRecord::Base
belongs_to :costumer
has_many :orders


before_create :set_costumer_id
before_create :set_cart_id

def add_order(order)
  update_attribute(:order_id, order.id)
end
private
def set_costumer_id
    self.costumer_id = current_costumer.id
  end
def set_cart_id
   self.cart_id = current_costumer.id
end
end
