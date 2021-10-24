class ProductVariantOptionValue < ApplicationRecord
  belongs_to :product_variant
  belongs_to :product_variant_option
end
