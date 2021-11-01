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

def initDefaultUser
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
    
end