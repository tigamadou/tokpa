class User < ApplicationRecord
  attr_accessor :skip_validations
  rolify 

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, unless: :skip_validations

  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :confirmable, :trackable

  has_one :profile,  dependent: :destroy 
  has_many :addresses, through: :profile
  has_one :cart,  dependent: :destroy 
  

  has_many :favorite,  dependent: :destroy 
  has_many :favorites, through: :favorite

  has_one :user_vendor
  has_one :vendor, through: :user_vendor

  has_many :orders, foreign_key: 'user_id', class_name: "Order",  dependent: :destroy 

  def before_add_method(role)
    # do something before it gets added
  end

  
end
