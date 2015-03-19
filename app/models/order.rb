class Order < ActiveRecord::Base

belongs_to :costumer
belongs_to :credit_card

belongs_to :adress
belongs_to :billing_adress

has_many :order_items

validates :costumer_id, presence: true
validates :completed_date, presence: true

before_save :save_price
after_save :book_count

 include AASM

  aasm do
    state :in_progress, :initial => true
    state :shipped
    state :completed

    event :ship do
      transitions :from => :in_progress, :to => :shipped
    end

    event :complete do
      transitions :from => :shipped, :to => :completed
    end

  
  end

  def calculate
    sum = 0
    order_items.each do |oi|
      sum+=oi.price
    end
    sum
  end
def book_count
  if aasm_state != "in_progress"
  order_items.each do |oi|
   oi.book.books_in_stock -= oi.quantity
   oi.book.save
 end
  end
end

  def save_price
    self.total_price = calculate
  end

end
