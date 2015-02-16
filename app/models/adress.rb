class Adress < ActiveRecord::Base

validates :adress, presence: true
validates :zipcode, presence: true
validates :city, presence: true
validates :phone, presence: true
validates :country, presence: true
end
