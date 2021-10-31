require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'associations' do   
    it { should have_many(:product_options) }   
    it { should have_many(:products) }   
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
