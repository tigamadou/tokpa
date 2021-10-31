class AddressVendor < ApplicationRecord
  
  belongs_to :address
  belongs_to :vendor
end
