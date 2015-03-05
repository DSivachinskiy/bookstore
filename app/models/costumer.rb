class Costumer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

belongs_to :role
has_many :orders
has_many :ratings
has_many :adresses
has_many :billing_adresses
has_many :credit_cards

validates :email, presence: true, uniqueness: true
validates :password, presence: true
validates :firstname, presence: true
validates :lastname, presence: true





end
