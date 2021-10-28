class ProductOption < ApplicationRecord
  belongs_to :product, inverse_of: :product_options
  belongs_to :option, dependent: :destroy 
  validates_presence_of :product
  validates_uniqueness_of :product_id, scope: :option_id
end
