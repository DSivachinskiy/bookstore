class Book < ActiveRecord::Base

belongs_to :category
belongs_to :author

has_many :ratings
has_many :order_items

validates :title, presence: true
validates :price, presence: true
validates :books_in_stock, presence: true

before_save :save_rating
before_save :img
def rating
	if ratings.size !=0
ratings.sum(:rating_number)/ratings.size
end
end
def img
	self.image = self.id
end

def save_rating
  self.total_rating = rating 
end
end
