require 'faker'

FactoryBot.define do
  factory :user do
    username { Faker::Name.unique.name[0...7] + rand(1..10).to_s }
    password { Faker::Internet.password }
  end
end
