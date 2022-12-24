FactoryBot.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password_digest { BCrypt::Password.create('12345678') }
    profile { [:other, :admin].sample }
    status { [:active, :inactive].sample }
  end
end
