class ApplicationController < ActionController::Base
  include ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :active_user, :current_cart

  protected
    def active_user
      @current_user ||= User.find(session[:current_id]) if session[:current_id]
    end

    def current_cart
      #@current_cart ||= Order.where(id: session[:user_id]) if session[:cart]
      @cart = !current_user.nil? ? Order.where("client_id = ? AND status != ?", current_user.client_id, 0) : Order.new
    end
end
