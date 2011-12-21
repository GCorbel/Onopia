class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  
  private
    def render_error_json(object)
      html = render_to_string( :partial => "shared/error_messages", :locals => { :target => object } )
      render :json => { state: 'error', html: html}
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def redirect_logged
      if current_user
        redirect_to root_path
      end
    end
    
    def redirect_logout
      unless current_user
        redirect_to login_path
      end
    end

end
