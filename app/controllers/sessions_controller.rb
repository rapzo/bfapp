class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params.permit(:email, :password)
    p params[:user]
    @user = User.authenticate(params[:user])
    if @user
      session[:current_user] = @user.id
      redirect_to root_url, :notice => "Welcome #{@user.name}!"
    else
      flash.now.alert = "Invalid credentials!"
      redirect_to login_path, :alert => "Invalid credentials!"
    end
  end

  def delete
    session.delete(:current_user)
    redirect_to root_url, :notice => "Goodbye!"
  end
end
