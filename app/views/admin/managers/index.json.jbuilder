json.array!(@managers) do |manager|
  json.extract! manager, :name, :email, :password_hash, :password_salt, :locked, :active
  json.url manager_url(manager, format: :json)
end
