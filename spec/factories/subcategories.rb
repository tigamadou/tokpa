FactoryBot.define do
  factory :subcategory do
    name {"My subcategory"}
    slug {'My subcategory'.parameterize}
    category {category}
    activated {true}
  end
end
