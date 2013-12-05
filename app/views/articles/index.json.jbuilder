json.array!(@articles) do |article|
  json.extract! article, :code, :description, :tax, :family, :pvp1, :pvp2, :pvp3, :storage, :type, :stock_change
  json.url article_url(article, format: :json)
end
