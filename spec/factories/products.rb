FactoryBot.define do
  factory :product do
    brand
    category
    title { Faker::Commerce.product_name}
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 30) }
    in_stock { true }
  end
end
