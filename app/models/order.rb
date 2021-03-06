class Order < ActiveRecord::Base

belongs_to :costumer
belongs_to :credit_card

belongs_to :adress
belongs_to :billing_adress

has_many :order_items

validates :costumer_id, presence: true


before_save :save_price
after_save :book_count

 include AASM

  aasm do
    state :in_progress, :initial => true
    state :waiting_for_processing
    state :in_delivery
    state :delivered

    event :accept do
      transitions :from => :in_progress, :to => :waiting_for_processing
    end

    event :delivery do
      transitions :from => :waiting_for_processing, :to => :in_delivery
    end

    event :complete do
      transitions :from => :in_delivery, :to => :delivered
    end

  
  end
  def true_coupon
    Coupon.where(number: coupon_number)
  end  

  def calculate
    sum = 0
    order_items.each do |oi|
      sum+=oi.price
    end
    unless ups.nil?
      sum+=ups
    end  
    unless coupon_number.nil?
      true_coupon.find do |c|
        if c.present?
          sum-=c.price
        end  
      end
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
def order_quantity
  if aasm_state == "in_progress"
    sum = 0
    order_items.each do |oi|
      sum+=oi.quantity
    end
  end
  sum
end
  def save_price
    self.total_price = calculate
  end

end
