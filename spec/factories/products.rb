FactoryBot.define do
  factory :product do
    brand
    category
    title { Faker::Commerce.product_name}
    description { Faker::Lorem.sentence }
    price { Faker::Number.decimal(l_digits: 6, r_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 30) }
    in_stock { Faker::Boolean.boolean }
  end
end
