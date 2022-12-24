FactoryBot.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password_digest { BCrypt::Password.create('12345678') }
    profile { :other }
    status { :active }

    trait :active do
      status { :active }
    end

    trait :inactive do
      status { :inactive }
    end

    trait :admin do
      profile { :admin }
    end

    factory :active_admin, traits: [:active, :admin]
    factory :inactive_admin, traits: [:inactive, :admin]
  end
end
