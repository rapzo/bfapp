json.array!(@admin_clients) do |admin_client|
  json.extract! admin_client, :id
  json.url admin_client_url(admin_client, format: :json)
end
