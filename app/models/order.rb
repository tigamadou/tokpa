class Order < ApplicationRecord
  validates :reference, presence: true
  validates :total, presence: true

  belongs_to :user
  belongs_to :vendor

  has_many :product
end
