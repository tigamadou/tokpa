class Vendor < ApplicationRecord
    has_one_attached :image
    has_one_attached :cover
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :legal_name, presence: true
    validates :incorporation_date, presence: true
    validates :registration_date, presence: true
    validates :registration_address, presence: true
    validates :registration_number, presence: true

    
    has_many :address_vendor, dependent: :destroy 
    has_many :addresses, through: :address_vendor, dependent: :destroy 
    has_many :order, dependent: :destroy 
    has_many :product, dependent: :destroy 

    has_many :favorites, class_name: 'Favorite', foreign_key: 'vendor_id', dependent: :destroy
    has_many :followers, through: :favorites, source: 'user', dependent: :destroy 

    has_one :user_vendor, dependent: :destroy, dependent: :destroy 
    has_one :user, through: :user_vendor, dependent: :destroy 
end
