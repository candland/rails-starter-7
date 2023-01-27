# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  has_many :account_users
  has_many :users, through: :account_users

  validates :name, presence: true

  def to_s
    name
  end
end
