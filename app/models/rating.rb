class Rating < ActiveRecord::Base

belongs_to :costumer
belongs_to :book
has_many :books

after_save :save_r

def save_r
self.book.save_rating
self.book.save
end
end
