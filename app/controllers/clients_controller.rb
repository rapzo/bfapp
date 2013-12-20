class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    begin
      response = HTTParty.get("#{APIURI}clients")
      data = JSON.parse(response.body)
      clients = Array.new
      data.map do |client|
        c = Client.new({
          code: client['CodCliente'],
          name: client['NomeCliente'],
          nif: client['NumContribuinte'],
          address: client['MoradaCliente'],
          phone:  client['Telefone'],
          currency: client['Moeda']
        })
        clients.push(c)
        p clients.inspect
      end
    end
    @clients = clients
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    
    if @client.valid?
      code = Random.new
      @client.code = code.rand(1000)
      ApiClient.save(@client)
    end

    respond_to do |format|
      if @client.valid?
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = ApiClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(
        :code,
        :name,
        :nif,
        :address,
        :phone,
        :fax,
        :country,
        :market,
        :payment_type,
        :payment_condition,
        :country,
        :discount,
        :currency
      )
    end
end
