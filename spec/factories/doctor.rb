require 'faker'

FactoryBot.define do
  factory :doctor do
    name { Faker::Lorem.sentence }
    image { Faker::Lorem.sentence }
    speciality { Faker::Lorem.sentence }
    location { Faker::Address.full_address }
  end
end
