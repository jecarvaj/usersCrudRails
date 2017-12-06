json.extract! user, :id, :rut, :first_name, :last_name, :mail, :birthday, :created_at, :updated_at
json.url user_url(user, format: :json)
