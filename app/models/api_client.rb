class ApiClient
  include HTTParty

  base_uri APIURI

  def self.prefix
    @prefix = "/clients/"
  end
  
  def self.find(id)
    response = get("#{base_uri}#{self.prefix}#{id}")
    data = JSON.parse(response.body)
    if data.nil?
      return Array.new
    end

    client = Client.new({
      id: data['CodCliente'],
      code: data['CodCliente'],
      name: data['NomeCliente'],
      nif: data['NumContribuinte'],
      address: data['MoradaCliente'],
      phone: data['Telefone'],
      currency: data['Moeda']
    })
  end

  def self.all
    response = get("#{base_uri}#{self.prefix}")
    data = JSON.parse(response.body)
    if data.nil?
      return Array.new
    end

    clients = Array.new
    data.map do |client|
      c = Client.new({
        id: client['CodCliente'],
        code: client['CodCliente'],
        name: client['NomeCliente'],
        nif: client['NumContribuinte'],
        address: client['MoradaCliente'],
        phone: client['Telefone'],
        currency: client['Moeda']
      })
      clients.push(c)
    end
    return clients
  end

  def self.save(client)
    code = Random.new

    response = post("#{base_uri}#{self.prefix}create", :body => {
        :CodCliente => code.rand(1000),
        :NomeCliente => client.name,
        :NumContribuinte => client.nif,
        :MoradaCliente => client.address,
        :Telefone => client.phone,
        :Moeda => client.currency
      }.to_json,
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json' })
    puts response
  end
end
