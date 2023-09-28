FactoryBot.define do
  factory :api_token do
    user
    name { "default" }
    deleted_at { nil }

    after(:build) do |token|
      token.make_token
    end
  end
end
