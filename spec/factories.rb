require 'faker'
FactoryGirl.define do
  factory :user do
    username {Faker::Name.name}
    sequence(:email) {|n| "email#{n}@gmail.com" }
    password "password"
  end
end

FactoryGirl.define do
  factory :category do
    name {Faker::Hipster.word}
  end
end
