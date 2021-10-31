require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe 'associations' do
    
    it { should belong_to(:category)}
    it { should have_many(:products)}   

  end

  describe 'validations' do
    it { should validate_presence_of(:name)}    
  end
end
