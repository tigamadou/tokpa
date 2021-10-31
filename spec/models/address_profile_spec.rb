require 'rails_helper'

RSpec.describe AddressProfile, type: :model do
  describe 'association' do
      it { should belong_to(:address)}
      it { should belong_to(:profile)}
  end
end
