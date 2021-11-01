require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do   
    it { should have_many(:cart_products) }
    it { should have_many(:products) }   
  end
end
