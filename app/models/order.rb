class Order < ApplicationRecord
  
  validates :total, presence: true

  belongs_to :user
  
  
  has_many :order_products, dependent: :destroy 
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products, :reject_if => proc { |attributes| attributes[:product_id].blank?  }, allow_destroy: true
end
