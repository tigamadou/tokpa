class Category < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true
    has_many :subcategories,  dependent: :destroy 
  
end
