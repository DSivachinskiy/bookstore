class Costumer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :orders
has_many :ratings


validates :email, presence: true, uniqueness: true
validates :password, presence: true
validates :firstname, presence: true
validates :lastname, presence: true



def add_new_order(params)
  orders.create(params)
end

def current_order
  orders.find(state:'in progress')
end



end
