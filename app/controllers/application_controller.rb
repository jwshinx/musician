class ApplicationController < ActionController::Base
  protect_from_forgery

  #helper :all
  #filter_parameter_logging :password, :password_confirmation
  helper_method :current_user

  private
  def current_user_session
=begin
    if defined?(@current_user_session)
      puts "===> AC.current_user_session.rec: #{current_user_session.record.username}" 
    else
      puts "===> AC.current_user_session not defined" 
    end
=end
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  def require_joel_user
    unless current_user && current_user_session.record.username == 'joel'
      store_location
      flash[:notice] = "You must be JOEL to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end
  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end
  def store_location
    session[:return_to] = request.request_uri
  end
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
