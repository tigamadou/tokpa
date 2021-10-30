class CartProduct < ApplicationRecord
  validates :quantity, presence: true
  validates :total, presence: true

  belongs_to :cart
  belongs_to :product

  def total_price
    self.quantity * self.product.price
  end
end
