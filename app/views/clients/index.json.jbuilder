json.array!(@clients) do |client|
  json.extract! client, :code, :name, :nif, :active, :locked, :address, :phone, :fax, :payment_condition, :payment_type, :market, :country, :discount
  json.url client_url(client, format: :json)
end
