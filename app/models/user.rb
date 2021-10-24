class User < ApplicationRecord
  attr_accessor :skip_validations
  rolify :before_add => :before_add_method

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, unless: :skip_validations

  
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :confirmable, :trackable

  has_one :profile
  has_many :addresses, through: :profile
  has_one :cart

  has_many :favorite
  has_many :vendors, through: :favorite

  has_many :orders, foreign_key: 'user_id', class_name: "Order"

  def before_add_method(role)
    # do something before it gets added
  end

  
end
