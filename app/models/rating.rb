class Rating < ActiveRecord::Base

belongs_to :costumer
belongs_to :book


after_save :save_r

def save_r
self.book.save_rating
self.book.save
end
end
