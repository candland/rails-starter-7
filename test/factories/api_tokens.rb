# == Schema Information
#
# Table name: api_tokens
#
#  id         :uuid             not null, primary key
#  calls      :integer          default(0), not null
#  deleted_at :datetime
#  name       :string           not null
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_api_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
