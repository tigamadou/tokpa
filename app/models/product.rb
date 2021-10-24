class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
  belongs_to :vendor

  has_many :product_variant
  has_many :product_option
  has_many :product_variant_option, through: :product_variant
end
