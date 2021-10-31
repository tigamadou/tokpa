require 'rails_helper'

RSpec.describe AddressProfile, type: :model do
  describe 'Association tests' do
    context 'presence name ' do
      it { should belong_to(:address)}
      it { should belong_to(:profile)}      
    end
  end
end
