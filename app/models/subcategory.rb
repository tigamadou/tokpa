class Subcategory < ApplicationRecord
  belongs_to :category
  validates :name, presence: :true
  has_many :product
end
