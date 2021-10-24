class AddressProfile < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_1, presence: true
  belongs_to :profile
  belongs_to :address

end
