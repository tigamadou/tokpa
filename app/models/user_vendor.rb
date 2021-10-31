class UserVendor < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
end
