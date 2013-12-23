class UsersController < ApplicationController
  before_action :active_user, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end


#  id         :integer          not null, primary key
#  client_id  :integer
#  article_id :integer
#  quantity   :integer
#  status     :integer
  def add_to_cart
    @order = Order.new(
      article_id: params[:article],
      client_id: current_user.client_id,
      quantity: params[:q],
      status: 1
    )
    respond_to do |format|
      if @order.save
        format.html { redirect_to :root, notice: 'Order added to cart.' }
      else
        format.html { redirect_to :root, notice: 'Error adding order to cart.' }
      end
    end
  end

  def remove_from_cart
    @order = Order.find(params[:order_id])
    respond_to do |format|
      if @order.destroy
        format.html { redirect_to :root, notice: 'Order removed from cart.' }
      else
        format.html { redirect_to :root, notice: 'Error removing order from cart.' }
      end
    end
  end

  def checkout
    @orders = Order.where(client_id: current_user.client_id)

    @orders.each do |order|
      ApiOrder.save(order)
      order.status = 0
      order.save
    end
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Orders posted, thank you for chosing us!' }
    end
  end

  def activate
    ApiClient.activate(@client)
    respond_to do |format|
      format.html { redirect_to @client }
      format.json { render action: 'show' }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create(
      email: @client.email,
      password: client_params[:password],
      salt: @client.password,
      client_id: @client.code
    )

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:curre])
    end

    def set_client
      @client = ApiClient.find(current_user.client_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
end
