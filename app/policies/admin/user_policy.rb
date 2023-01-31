class Admin::UserPolicy < Admin::AdminPolicy
  def impersonate?
    context.user.admin?
  end

  def permitted_attributes
    [:email,
      :first_name,
      :last_name,
      :password,
      :confirmed?,
      :locked_at?,
      :confirmed_at,
      :locked_at,
      roles: []]
  end

  class Scope < Scope
    def resolve
      if context.user.admin?
        User.all
      else
        User.none
      end
    end
  end
end
