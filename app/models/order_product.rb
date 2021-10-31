class OrderProduct < ApplicationRecord
  validates :quantity, presence: true
  validates :total, presence: true
  
  belongs_to :order
  belongs_to :product
end
