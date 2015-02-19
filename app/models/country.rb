class Country < ActiveRecord::Base

has_many :adresses
has_many :billing_adresses
validates :name, presence: true, uniqueness: true
end
