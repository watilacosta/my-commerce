FactoryBot.define do
  factory :category do
    description { Faker::Commerce.unique.department(max: 2) }
  end
end
