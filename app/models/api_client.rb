class ApiClient
  include HTTParty

  base_uri APIURI


  def self.prefix
    @prefix = "/clients"
  end
  
  def self.find(id)
    response = get("#{base_uri}#{self.prefix}/#{id}")
    data = JSON.parse(response.body)
    
    return Array.new if data.nil?

    client = Client.new(values(data))
  end

  def self.all
    response = get("#{base_uri}#{self.prefix}")
    data = JSON.parse(response.body)
    
    return Array.new if data.nil?

    clients = Array.new
    data.map do |client|
      c = Client.new(values(client))
      clients.push(c)
    end
    return clients
  end

  def self.save(client)
    options = options(client)
    puts options[:body]
    response = post("#{base_uri}#{self.prefix}/create", options)
    puts "RESPONSE CODE: #{response.code}"
    return true
  end

  def self.activate(client)
    options = options(client)
    puts options[:body]
    response = put("#{base_uri}#{self.prefix}/update", options)
    puts response.code
    return response
  end

  def self.update(client)
    options = options(client)
    puts options[:body]
    response = put("#{base_uri}#{self.prefix}/update", options)
    puts response.code
    return response
  end

  protected
    def self.options(client)
      {
        :body => {
          :CodCliente => client.code,
          :NomeCliente => client.name,
          :NumContribuinte => client.nif,
          :MoradaCliente => client.address,
          :Telefone => client.phone,
          :Moeda => Client.currency[:euro],
          :Password => client.password,
          :email => client.email,
          :Username => client.email
        }.to_json,
        :headers => {
          'Content-Type' => 'application/json', 'Accept' => 'application/json'
        }
      }
    end

    def self.values(data)
      {
        id: data['CodCliente'],
        code: data['CodCliente'],
        name: data['NomeCliente'],
        nif: data['NumContribuinte'],
        address: data['MoradaCliente'],
        phone: data['Telefone'],
        currency: data['Moeda'],
        password: data['Password'],
        email: data['email'],
        username: data['Username']
      }
    end
end
