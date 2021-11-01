class CartProduct < ApplicationRecord
  

  belongs_to :cart
  belongs_to :product

  def total_price
    self.quantity * self.product.variants.first.price
  end
end
