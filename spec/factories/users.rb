FactoryBot.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 8) }
    profile { [:other, :admin].sample }
    status { [:active, :inactive].sample }
  end
end
