FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { "P@sswOrd" }
  end
end
