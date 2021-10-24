class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :product_option
end
