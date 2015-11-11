FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    password "password"
    username "angelita"
  end

  factory :category do
    name "Music"
  end

  factory :topic, parent: :category do |f|
    f.name "Folk Songs"
  end

  factory :conversation, parent: :topic do |f|
    f.name "Best song about Angelita?"
  end

  factory :message, parent: :conversation do |f|
    f.content "I prefer the one that is written in italian"
  end

end
