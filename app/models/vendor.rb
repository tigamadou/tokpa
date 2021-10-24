class Vendor < ApplicationRecord
    has_one_attached :image
    has_one_attached :cover
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :incorporation_date, presence: true
    validates :registration_date, presence: true
    validates :registration_address, presence: true
    validates :registration_number, presence: true

    
    has_many :address_vendor
    has_many :addresses, through: :address_vendor
    has_many :order
    has_many :product

    has_many :favorites, class_name: 'Favorite', foreign_key: 'vendor_id', dependent: :destroy
    has_many :followers, through: :favorites, source: 'user'
end
