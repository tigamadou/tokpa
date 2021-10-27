# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create default admin user
def create_user
    return User.create(
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456',
        confirmed_at: DateTime.now
    )
end

def create_profile(user)
    profile = Profile.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_1: Faker::PhoneNumber.cell_phone ,
        user_id: user.id
    )
end

def create_vendor(user)
    vendor = Vendor.create(
        name: Faker::Company.name,
        description: Faker::Lorem.paragraph_by_chars,
        legal_name: Faker::Company.name,
        incorporation_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_date: Faker::Date.between(from: '1990-01-01', to: Date.today) ,
        registration_address: Faker::Address.full_address,
        registration_number: Faker::IDNumber.valid ,

    )
    UserVendor.create(user_id: user.id, vendor_id: vendor.id)
end

def create_vendors(n)
    n.times do 
        user = create_user()
        user.add_role :vendor
        create_profile user
        create_vendor user
    end
end
admin = User.create(
    email: 'admin@tokpa.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)

user = User.create(
    email: 'amadou140589@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)
vendor = User.create(
    email: 'vendor@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)
admin.add_role :admin
user.add_role :customer
vendor.add_role :vendor

create_profile(admin)
create_profile(user)
create_profile(vendor)
create_vendor(vendor)
create_vendors 9
