require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:user)}
    it { should belong_to(:vendor)}
    it { should have_many(:order_products)}
    it { should have_many(:products)}
  end

  describe 'validations' do
    it { should validate_presence_of(:reference)}
    it { should validate_presence_of(:total)}
  end
end
