class OrderProduct < ApplicationRecord
  validates :quantity, presence: true
  validates :total, presence: trues
  
  belongs_to :order
  belongs_to :product
end
