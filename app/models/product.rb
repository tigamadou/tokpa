class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
  belongs_to :vendor

  has_many :product_variant, dependent: :destroy 
  has_many :product_variant_option, through: :product_variant
  
  validates :name, presence: :true
  validates :description, presence: :true
  validates :name, presence: :true

  has_many :product_options, inverse_of: :product
  has_many :options, through: :product_options
  
  accepts_nested_attributes_for :product_options, :reject_if => proc { |attributes| attributes[:option_id].blank?  }, allow_destroy: true
end
