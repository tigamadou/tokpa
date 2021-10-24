class User < ApplicationRecord
  rolify :before_add => :before_add_method
  after_create :assign_default_role

  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }, unless: :skip_validations

  def assign_default_role
    self.add_role(:defaults) if self.roles.blank?
  end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :confirmable, :trackable

  has_one :profile
  has_many :addresses, through: :profile
  has_one :cart

  has_many :favorite
  has_many :vendors, through: :favorite
  def before_add_method(role)
    # do something before it gets added
  end
end
