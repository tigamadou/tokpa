class Profile < ApplicationRecord
  belongs_to :user
  has_many :address_profiles
  has_many :addresses, through: :address_profiles
end
