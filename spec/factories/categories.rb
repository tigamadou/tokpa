FactoryBot.define do
  factory :category do
    name {'My Category'}
    slug { 'My category'.parameterize}
    activated {true}
  end
end
