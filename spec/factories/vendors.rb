FactoryBot.define do
  factory :vendor do
    name {'Vendor name'}
    description { 'Lorem ipsum dollor'}
    online  { true }
    legal_name { 'Sample Legal Name' } 
    incorporation_date { Date.today}
    registration_date { Date.today-100}
    registration_address { 'Random adress'}
    registration_number { '12345678/'}
    verified {true}
    activated {true}
  end
end
