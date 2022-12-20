FactoryBot.define do
  factory :product do
    title { "MyString" }
    description { "MyText" }
    price { "9.99" }
    quantity { 1 }
    in_stock { false }
    brand { nil }
    category { nil }
  end
end
