class UserSessionsController < ApplicationController

  #before_filter :redirect_if_logged, :except => :destroy

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
    @user_session = @current_user_session
    if @user_session
      @user_session.destroy
    end
    redirect_to login_path
  end
end
