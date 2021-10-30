class Category < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true,uniqueness: :true
    has_many :subcategories,  dependent: :destroy 
    has_many :products, through: :subcategories, source: :products
  
end
