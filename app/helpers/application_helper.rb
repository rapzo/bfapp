module ApplicationHelper
  def signed?
    not session[:current_user].blank?
  end

  def current_user
    User.find(session[:current_user])
  end

  def authenticate
    redirect_to login_url if session[:current_user].blank?
  end

  def pics(id, width, height)
    "#{APIURI}articles/#{id}/image/#{width}/#{height}"
  end
end
