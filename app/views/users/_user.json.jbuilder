json.extract! user, :id, :rut, :first_name, :last_name, :mail, :birthday, :created_at, :updated_at,:image_url
json.url user_url(user, format: :json)
