class ApiOrder
  include HTTParty

  base_uri APIURI


  def self.prefix
    @prefix = "/orders"
  end
  
  def self.find(id)
    response = get("#{base_uri}#{self.prefix}/#{id}")
    data = JSON.parse(response.body)
    
    return Array.new if data.nil?

    order = order.new(values(data))
  end

  def self.all
    response = get("#{base_uri}#{self.prefix}")
    data = JSON.parse(response.body)
    
    return Array.new if data.nil?

    orders = Array.new
    data.map do |order|
      c = order.new(values(order))
      orders.push(c)
    end
    return orders
  end

  def self.save(order)
    options = options(order)
    puts options[:body]
    response = post("#{base_uri}#{self.prefix}/create", options)
    puts "RESPONSE CODE: #{response.code}"
    return true
  end

  def self.update(order)
    options = options(order)
    puts options[:body]
    response = put("#{base_uri}#{self.prefix}/update", options)
    puts response.code
    return response
  end

  protected
    def self.options(order)
      {
        :body => {
          :Cliente => order.client_id,
          :CodArtigo => order.article_id,
          :Quantidade => order.quantity
        }.to_json,
        :headers => {
          'Content-Type' => 'application/json', 'Accept' => 'application/json'
        }
      }
    end

    def self.values(data)
      {
        id: data['NumDoc'],
        code: data['NumDoc'],
        client_id: data['Cliente'],
        article_id: data['CodArtigo'],
        quantity: data['Quantidade']
      }
    end
end
