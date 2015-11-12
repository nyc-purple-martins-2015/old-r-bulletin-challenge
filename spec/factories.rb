FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    username "amyhliao"
    password "password"
  end

  factory :invalid_user, parent: :user do |f|
    f.username nil
  end

  factory :message do
    content "how now brown cow"
    conversation_id "1"
  end

  factory :invalid_message, parent: :message do |f|
    f.content nil
  end

  factory :conversation do
    name "Ron Burgundy"
    association :author, factory: :user
    association :topic
  end
end