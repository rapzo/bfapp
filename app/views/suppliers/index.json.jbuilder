json.array!(@suppliers) do |supplier|
  json.extract! supplier, :code, :name, :nif, :active, :locked, :address, :phone, :fax, :payment_condition, :payment_type, :market, :country, :discount
  json.url supplier_url(supplier, format: :json)
end
