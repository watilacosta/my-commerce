FactoryBot.define do
  factory :flashcard do
    question { Faker::Lorem.sentence(word_count: 3) }
    response { Faker::Lorem.sentence(word_count: 4) }
    active { true }
    user

    trait :inactive do
      active { false }
    end
  end
end
