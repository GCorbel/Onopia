class UserSessionsController < ApplicationController

  before_filter :redirect_logged

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user = User.new
    @user_session = UserSession.new
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = true
    if @user_session.save
      flash[:notice] = "Bienvenue #{@user_session.user.username}"
      render :json => { state: 'success', redirect: root_path}
    else 
      render_error_json(@user_session)
    end
  end
end
