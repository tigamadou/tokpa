require_relative 'product_seeder'

def create_vendor(user, category)
    vendor = Vendor.create(
        name: Faker::Company.name,
        description: Faker::Lorem.paragraph_by_chars,
        legal_name: Faker::Company.name,
        incorporation_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_address: Faker::Address.full_address,
        registration_number: Faker::IDNumber.valid,
        activated: true,
        verified: true,
        online: true
    )
    UserVendor.create(user_id: user.id, vendor_id: vendor.id)
    vendor.image.attach(io: File.open("app/assets/images/500x500.png"), filename: '500x500.png',  identify: false)
    vendor.cover.attach(io: File.open("app/assets/images/1200x280.png"), filename: '1200x280.png',  identify: false)
    create_products(5, vendor, category)
end



def create_vendors()
    puts '  Seeding vendors...'
    Category.all.each do |category|

        user = create_user()
        user.add_role :vendor
        create_profile user
        create_vendor user, category
    end
   
end