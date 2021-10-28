class ProductVariantOption < ApplicationRecord
  belongs_to :product_variant
  belongs_to :product_option

  # validates_uniqueness_of :product_option_id, scope: :product_variant_id
end
