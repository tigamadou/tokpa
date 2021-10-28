class ProductVariant < ApplicationRecord
  has_one_attached :image
  belongs_to :product

  validates :price, presence: :true
  validates :sku, presence: :true
  validates :quantity, presence: :true
  has_many :product_variant_options, inverse_of: :product_variant, dependent: :destroy 
  has_many :product_options, through: :product_variant_options, foreign_key: 'product_option_id',class_name: 'ProductOption'
  
  validates :product_variant_options, presence: :true
  accepts_nested_attributes_for :product_variant_options, allow_destroy: true
end
