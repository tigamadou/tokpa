require 'rails_helper'

RSpec.describe Vendor, type: :model do
  describe 'Validation tests' do
    context 'presence name ' do
      it 'fails if name not  provided' do 
        vendor = Vendor.new 
        vendor.name = nil
        vendor.validate
        expect(vendor.errors[:name]).to include("can't be blank")
      end

      it 'works if name   provided' do 
        vendor = Vendor.new 
        vendor.name = 'Yoo'
        vendor.validate  
        expect(vendor.errors[:name]).to_not include("can't be blank")
      end     
    end

    context 'presence description ' do
      it 'fails if description not  provided' do 
        vendor = Vendor.new 
        vendor.description = nil
        vendor.validate
        expect(vendor.errors[:description]).to include("can't be blank")
      end

      it 'works if description   provided' do 
        vendor = Vendor.new 
        vendor.description = 'Yoo'
        vendor.validate  
        expect(vendor.errors[:description]).to_not include("can't be blank")
      end     
    end

    context 'presence legal_name ' do
      it 'fails if description   provided' do 
        vendor = Vendor.new 
        vendor.legal_name = nil
        vendor.validate
        expect(vendor.errors[:legal_name]).to include("can't be blank")
      end

      it 'works if legal_name   provided' do 
        vendor = Vendor.new 
        vendor.legal_name = 'Yoo'
        vendor.validate  
        expect(vendor.errors[:legal_name]).to_not include("can't be blank")
      end     
    end

    context 'presence incorporation_date ' do
      it 'fails if incorporation_date not  provided' do 
        vendor = Vendor.new 
        vendor.incorporation_date = nil
        vendor.validate
        expect(vendor.errors[:incorporation_date]).to include("can't be blank")
      end

      it 'works if incorporation_date   provided' do 
        vendor = Vendor.new 
        vendor.incorporation_date = Date.today
        vendor.validate  
        expect(vendor.errors[:incorporation_date]).to_not include("can't be blank")
      end     
    end

    context 'presence registration_date ' do
      it 'fails if registration_date not  provided' do 
        vendor = Vendor.new 
        vendor.registration_date = nil
        vendor.validate
        expect(vendor.errors[:registration_date]).to include("can't be blank")
      end

      it 'works if registration_date   provided' do 
        vendor = Vendor.new 
        vendor.registration_date = Date.today
        vendor.validate  
        expect(vendor.errors[:registration_date]).to_not include("can't be blank")
      end     
    end

    context 'presence registration_address ' do
      it 'fails if registration_address not  provided' do 
        vendor = Vendor.new 
        vendor.registration_address = nil
        vendor.validate
        expect(vendor.errors[:registration_address]).to include("can't be blank")
      end

      it 'works if registration_address   provided' do 
        vendor = Vendor.new 
        vendor.registration_address = 'My address'
        vendor.validate  
        expect(vendor.errors[:registration_address]).to_not include("can't be blank")
      end     
    end

    context 'presence registration_number ' do
      it 'fails if registration_number not  provided' do 
        vendor = Vendor.new 
        vendor.registration_number = nil
        vendor.validate
        expect(vendor.errors[:registration_number]).to include("can't be blank")
      end

      it 'works if registration_number   provided' do 
        vendor = Vendor.new 
        vendor.registration_number = 'My address'
        vendor.validate  
        expect(vendor.errors[:registration_number]).to_not include("can't be blank")
      end     
    end
    
  end
end
