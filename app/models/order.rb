class Order < ActiveRecord::Base

belongs_to :costumer
belongs_to :credit_card
belongs_to :order_status
belongs_to :adress
belongs_to :billing_adress

has_many :order_items

validates :costumer_id, presence: true
validates :completed_date, presence: true

before_save :save_price

  def calculate
    sum = 0
    order_items.each do |oi|
      sum+=oi.price
    end
    sum
  end

  def save_price
    self.total_price = calculate
  end

end
