json.array!(@orders) do |order|
  json.extract! order, :client_id, :article_id, :quantity, :status
  json.url order_url(order, format: :json)
end
