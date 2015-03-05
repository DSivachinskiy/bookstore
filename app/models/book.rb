class Book < ActiveRecord::Base

belongs_to :category
belongs_to :author

has_many :ratings
has_many :order_items


validates :title, presence: true
validates :price, presence: true
validates :books_in_stock, presence: true

def total_rating
	if ratings.size !=0
ratings.sum(:rating_number)/ratings.size
end
end

end
