FactoryBot.define do
    factory :user do
      email { 'username@example.com' }
      password { 'password' }
      confirmed_at {Date.today}
    end
  end