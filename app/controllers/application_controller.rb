class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  helper :all
  helper_method :current_user_session, :current_user
  #filter_parameter_logging :password, :password_confirmation
  
  before_filter :set_current_user
  
  protected
  
  def set_current_user
    Authorization.current_user = current_user
  end
  
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to '/'
  end
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_url
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
      session[:return_to] = request.fullpath
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
