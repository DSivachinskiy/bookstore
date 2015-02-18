class Order < ActiveRecord::Base

belongs_to :costumer
belongs_to :credit_card

has_many :order_items
has_one :adress
has_one :billing_adress



validates :costumer_id, presence: true
validates :completed_date, presence: true
validates :state, presence: true

def add_order_item(order_item)
  update_attribute(:order_item_id, order_item.id)
end

def total_price
  order_items.sum(:price)
end


end
