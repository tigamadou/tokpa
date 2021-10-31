class User < ApplicationRecord
  attr_accessor :skip_validations
  rolify 

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, unless: :skip_validations

  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :confirmable, :trackable

  has_one :profile, dependent: :destroy 
  has_many :addresses, through: :profile, dependent: :destroy 
  
  

  has_many :favorites,  dependent: :destroy 
  

  has_one :user_vendor, dependent: :destroy 
  has_one :vendor, through: :user_vendor, dependent: :destroy 

  has_many :orders, foreign_key: 'user_id', class_name: "Order",  dependent: :destroy 

end
