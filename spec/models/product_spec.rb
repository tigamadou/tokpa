require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { should belong_to(:subcategory)}
    it { should belong_to(:brand)}
    it { should belong_to(:vendor)}
    it { should have_one(:category)}
    it { should have_many(:variants)}
    it { should have_many(:product_variant_options)}
    it { should have_many(:product_options)}
    it { should have_many(:options)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:product_options)}
    it { should accept_nested_attributes_for(:product_options)}
  end
end
