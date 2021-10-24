class Address < ApplicationRecord
    validates :name, presence: true
    validates :line_1, presence: true
    validates :country, presence: true
    validates :city, presence: true
    validates :zip, presence: true
end
