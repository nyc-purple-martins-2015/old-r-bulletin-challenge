FactoryGirl.define do

  factory :user do
    email "cat2@example.com"
    username "calvin"
    password "cat"
  end

  factory :topic do
    name "kittens"
  end

  factory :conversation do
    name "kittens and cats"
    association :author, factory: :user
    association :topic
  end


end
