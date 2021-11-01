class Option < ApplicationRecord
    has_many :product_options, dependent: :delete_all 
    has_many :products, through: :product_options
    validates :name, presence: true
end
