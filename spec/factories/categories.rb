FactoryBot.define do
  factory :category do
    description { Faker::Commerce.department(max: 1) }
  end
end
