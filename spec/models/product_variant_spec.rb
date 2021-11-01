require 'rails_helper'

RSpec.describe ProductVariant, type: :model do
  describe 'associations' do
    it { should have_one_attached(:image)}
    it { should belong_to(:product)}
    it { should have_many(:product_variant_options)}
    it { should have_many(:product_options)}
  end

  describe 'validations' do
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:sku)}
    it { should validate_presence_of(:quantity)}
    it { should validate_presence_of(:product_variant_options)}
    it { should accept_nested_attributes_for(:product_variant_options)}
  end
end
