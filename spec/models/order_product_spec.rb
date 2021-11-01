require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  describe 'associations' do   
    it { should belong_to(:order) }   
    it { should belong_to(:product) }   
  end

  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:total) }
  end
end
