class CartProduct < ApplicationRecord
  validates :quantity, presence: true
  validates :total, presence: true

  belongs_to :cart
  belongs_to :product
end
