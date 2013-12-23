json.array!(@users) do |user|
  json.extract! user, :name, :email, :password, :company, :address, :phone, :active, :locked
  json.url user_url(user, format: :json)
end
