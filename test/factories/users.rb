FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name { "user" }
    sequence(:email) { |n| "user_#{n}@rails-starter-7.com" }
    password { "testing88" }
    password_confirmation { "testing88" }
    confirmed_at { DateTime.current }
  end
end
