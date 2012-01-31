class UserSessionsController < ApplicationController

  before_filter :redirect_if_logged, :except => :destroy

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
    unless @user_session.save
      render :new, :format => :js
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    if @current_user_session
      @user_session = @current_user_session
    else
      @user_session = UserSession.find
    end
    if @user_session
      @user_session.destroy
    end
    redirect_to login_path
  end
end
