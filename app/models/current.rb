class Current < ActiveSupport::CurrentAttributes
  attribute :user, :account, :true_user
end
