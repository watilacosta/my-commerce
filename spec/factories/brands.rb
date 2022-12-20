FactoryBot.define do
  factory :brand do
    description { Faker::Commerce.brand }
  end
end
