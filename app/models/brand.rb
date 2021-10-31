class Brand < ApplicationRecord
    has_one_attached :image
    validates :name, presence: true
    has_many :products
end
