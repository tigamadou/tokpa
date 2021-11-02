FactoryBot.define do
  factory :profile do
    first_name {Faker::Name.first_name }
    last_name {Faker::Name.last_name }
    phone_1 {Faker::PhoneNumber.cell_phone }
    phone_2 {Faker::PhoneNumber.cell_phone }
    user { user}
  end
end
