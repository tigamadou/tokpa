require 'rails_helper'

RSpec.describe AddressVendor, type: :model do
  describe 'associations' do   
      it { should belong_to(:address) }
      it { should belong_to(:vendor) }   
  end
 
end
