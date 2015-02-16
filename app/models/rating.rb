class Rating < ActiveRecord::Base

belongs_to :costumer
belongs_to :book
has_many :books

end
