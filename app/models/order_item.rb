class OrderItem < ActiveRecord::Base

belongs_to :book
belongs_to :order



validates :quantity, presence: true


def price
Book.where(id: book_id).find do |b|
return b.price*quantity
end
end

end
