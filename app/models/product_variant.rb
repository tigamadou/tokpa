class ProductVariant < ApplicationRecord
  has_one_attached :image
  belongs_to :product

  validates :price, presence: :true
  validates :sku, presence: :true
  validates :quantity, presence: :true
end
