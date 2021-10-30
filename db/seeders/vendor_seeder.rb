require_relative 'product_seeder'

def create_vendor(user)
    vendor = Vendor.create(
        name: Faker::Company.name,
        description: Faker::Lorem.paragraph_by_chars,
        legal_name: Faker::Company.name,
        incorporation_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_address: Faker::Address.full_address,
        registration_number: Faker::IDNumber.valid
    )
    UserVendor.create(user_id: user.id, vendor_id: vendor.id)
    create_products(5, vendor)
end



def create_vendors(n)
    n.times do 
        user = create_user()
        user.add_role :vendor
        create_profile user
        create_vendor user
    end
end