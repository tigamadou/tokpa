require 'rails_helper'

RSpec.describe ProductOption, type: :model do
  describe 'associations' do
    it { should belong_to(:option)}
    it { should belong_to(:product)}
  end
  
end
