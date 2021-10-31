require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  describe 'association' do
    it { should belong_to(:cart)}
    it { should belong_to(:product)}
  end
end
