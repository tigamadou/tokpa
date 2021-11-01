require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should have_one_attached(:image)}
    it { should belong_to(:user)}
    it { should have_many(:address_profiles)}
    it { should have_many(:addresses)}

  end

  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:phone_1)}
    
  end
end
