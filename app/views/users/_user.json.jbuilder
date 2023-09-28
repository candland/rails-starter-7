json.extract! user, :id, :email, :first_name, :last_name
json.avatar_url user.gravatar_url
json.roles user.roles
