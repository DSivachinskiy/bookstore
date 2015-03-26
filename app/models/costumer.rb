class Costumer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
      	:url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, 
      	:nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email,
      	 :password => Devise.friendly_token[0,20], :firstname => access_token.extra.raw_info.name, :lastname => access_token.extra.raw_info.name) 
    end
  end



end
