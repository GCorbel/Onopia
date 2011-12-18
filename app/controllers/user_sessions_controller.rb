class UserSessionsController < ApplicationController
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new
    @user = User.new
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user = User.new
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = true
    if @user_session.save
      flash[:notice] = "Bienvenue #{@user_session.user.username}"
      render :json => { state: 'success', redirect: root_path}
    else 
      html = render_to_string( :partial => "shared/error_messages", :locals => { :target => @user_session } )
      render :json => { state: 'error', html: html}
    end
  end
end
