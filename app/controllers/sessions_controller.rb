class SessionsController < ApplicationController
  def new
  end

  def create
    params.permit(:email, :password, :password_confirm)
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome #{user.name}!"
    else
      flash.now.alert = "Invalid credentials!"
      render "new"
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_url, :notice => "Goodbye!"
  end
end
