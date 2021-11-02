FactoryBot.define do
  factory :profile do
    first_name {Faker::Name.first_name }
    first_last {Faker::Name.first_last }
    phone_1 {Faker::PhoneNumber.cell_phone }
    phone_2 {Faker::PhoneNumber.cell_phone }
    user { user}
  end
end
