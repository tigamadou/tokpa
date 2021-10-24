class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :address_profiles,  dependent: :destroy 
  has_many :addresses, through: :address_profiles
end
