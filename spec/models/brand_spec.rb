require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'associations' do   
    it { should have_one_attached(:image) }
    it { should have_many(:products) }   
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
