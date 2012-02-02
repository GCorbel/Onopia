class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  
  private    
    #get the user session with authlogic
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
  
    #get the current user
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    #If the user is logged it must be redirect to the home path
    def redirect_if_logged
      if current_user
        redirect_to root_path
      end
    end
    
    #If the user is not logged it must be redirect to the login path
    def redirect_if_logout
      unless current_user
        redirect_to login_path
      end
    end

end
