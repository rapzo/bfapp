class ApiArticle
  include HTTParty

  base_uri APIURI

  def self.prefix
    @prefix = "/articles/"
  end
  
  def self.find(id)
    response = get("#{base_uri}#{self.prefix}#{id}")
    data = JSON.parse(response.body)
    if data.nil?
      return Article.new
    end

    article = Article.new({
      id: data['CodArtigo'],
      code: data['CodArtigo'],
      name: data['DescArtigo'],
      price: data['Preco'],
      unit: data['Unidade']
    })
  end

  def self.all
    response = get("#{base_uri}#{self.prefix}")
    data = JSON.parse(response.body)
    if data.nil?
      return Array.new
    end

    articles = Array.new
    data.map do |article|
      a = Article.new({
        id: article['CodArtigo'],
        code: article['CodArtigo'],
        name: article['DescArtigo'],
        price: article['Preco'],
        unit: article['Unidade']
      })
      articles.push(a)
    end
    return articles
  end
end
