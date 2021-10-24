class Cart < ApplicationRecord
  validates :quantity, presence: true
  
  belongs_to :user
  has_many :product
  has_many :products, through: :product
end
