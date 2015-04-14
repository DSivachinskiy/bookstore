class Book < ActiveRecord::Base

belongs_to :category
belongs_to :author

has_many :ratings
has_many :order_items

validates :title, presence: true
validates :price, presence: true
validates :books_in_stock, presence: true


before_save :img


def img
	self.image = self.id
end


end
