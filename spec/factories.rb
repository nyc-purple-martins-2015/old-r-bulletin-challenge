FactoryGirl.define do
  factory :category do
    name {Faker::Book.title}
  end
  factory :topic do
    name {Faker::Book.title}
    category
  end
  factory :conversation do
    name {Faker::Book.title}
    topic
    association :author, factory: :user
  end
  factory :user do
    username {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
  end
  factory :message do
    content {Faker::Lorem.paragraph}
    conversation
  end
end
