class UserSessionsController < ApplicationController
# GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new
    @user = User.new
    render "home/index"
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = true
    if @user_session.save
      redirect_to(root_path)
    else
      render "home/index"
    end
  end
end
