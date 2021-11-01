require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do   
    it { should have_many(:address_profiles) }
    it { should have_many(:address_vendors) }   
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:line_1) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zip) }
  end
end
