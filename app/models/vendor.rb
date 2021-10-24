class Vendor < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :incorporation_date, presence: true
    validates :registration_date, presence: true
    validates :registration_address, presence: true
    validates :registration_number, presence: true

    belongs_to :user
    has_many :address_vendor
    has_many :addresses, through: :address_vendor
    has_many :favorite, as: :favorites
    has_many :followers, through: :favorite, class_name: 'user'
    has_many :order
    has_many :product
end
