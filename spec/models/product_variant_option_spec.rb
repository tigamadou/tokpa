require 'rails_helper'

RSpec.describe ProductVariantOption, type: :model do
  describe 'associations' do
    it { should belong_to(:product_variant)}
    it { should belong_to(:product_option)}
  end
end
