class UserSessionsController < ApplicationController

  before_filter :redirect_logged, :except => :destroy

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

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    if @user_session
      @user_session.destroy
    end
    #if ENV["RAILS_ENV"] == "test"
    #  @current_user.active = false 
    #  @current_user.save
    #end
    redirect_to login_path
  end
end
