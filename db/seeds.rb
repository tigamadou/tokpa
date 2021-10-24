# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create default admin user
admin = User.create(
    email: 'admin@tokpa.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)

admin.add_role :admin
Profile.create(
    first_name: 'Admin',
    last_name: 'Tokpa',
    phone_1: '+22967211963',
    user_id: admin.id
)

user = User.create(
    email: 'amadou140589@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)

user.add_role :customer

vendorUser = User.create(
    email: 'vendor@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    confirmed_at: DateTime.now
)

vendorUser.add_role :vendor

# Create one vendor
