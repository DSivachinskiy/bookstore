class Costumer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


has_many :orders
has_many :ratings
has_one :adress
has_one :billing_adress
has_one :credit_card

validates :email, presence: true, uniqueness: true
validates :password, presence: true
validates :firstname, presence: true
validates :lastname, presence: true

def self.find_for_facebook_oauth access_token
    if costumer = Costumer.where(:url => access_token.info.urls.Facebook).first
      costumer
    else 
      Costumer.create!(:provider => access_token.provider, 
      	:url => access_token.info.urls.Facebook, :email => access_token.extra.raw_info.email,
      	 :password => Devise.friendly_token[0,20], :firstname => access_token.extra.raw_info.first_name, 
         :lastname => access_token.extra.raw_info.last_name) 
    end
  end



end
