class Adress < ActiveRecord::Base

has_many :orders
belongs_to :country
belongs_to :costumer

validates :adress, presence: true
validates :zipcode, presence: true
validates :city, presence: true
validates :phone, presence: true

end
