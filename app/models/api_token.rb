# frozen_string_literal: true

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
class ApiToken < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :token, presence: true

  scope :active, -> { where(deleted_at: nil) }

  scope :deleted, -> { where.not(deleted: nil) }

  def delete!
    update(deleted_at: Time.current)
  end

  def called!
  end

  def make_token
    self.token = JsonToken.encode({user_id: user_id})
    self
  end

  def to_s
    name
  end
end
