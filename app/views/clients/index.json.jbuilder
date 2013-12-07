json.array!(@clients) do |client|
  json.extract! client, :code, :name, :nif, :address, :phone, :fax, :country, :market, :payment_type, :payment_condition, :country, :discount, :currency
  json.url client_url(client, format: :json)
end
