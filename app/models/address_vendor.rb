class AddressVendor < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :legal_name, presence: true
  validates :incorporation_date, presence: true
  validates :registration_date, presence: true
  validates :registration_address, presence: true
  validates :registration_number, presence: true
  belongs_to :address
  belongs_to :vendor
end
