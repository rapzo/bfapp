class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index    
    @clients = ApiClient.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @user = User.create(
      email: @client.email,
      password: @client.password,
      client_id: @client.code
    )
    @user = User.find_by(client_id: @client.code)
    @orders = Order.where(client_id: @client.code)
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
      old_password = @client.password
      @client.password = SecureRandom.hex(6)
      status = ApiClient.save(@client)

      if status
        @user = User.create(
          name: @client.name,
          email: @client.email,
          password: old_password,
          password_salt: @client.password,
          client_id: @client.code
        )
      end
    end

    respond_to do |format|
      if status
        format.html { redirect_to client_path(@client.code), notice: 'Client was successfully created.' }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new', notice: 'Could not create a client.' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if @client.valid?
      old_password = @client.password
      @client.password = SecureRandom.hex(6)
      status = ApiClient.update(@client)

      user = User.find_by(client_id: @client.code)

      if user
        user.name = @client.name
        user.email = @client.email
        user.password = old_password
        user.password_salt = @client.password
        user.client_id = @client.code
        user.save
      end
    end

    respond_to do |format|
      if @client.valid?
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
      @client = ApiClient.find(params[:code])
    end

    def create_user(data)
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
        :currency,
        :email,
        :password
      )
    end
end
