FactoryBot.define do
  factory :brand do
    description { Faker::Commerce.unique.brand }
  end
end
