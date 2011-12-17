class UsersController < ApplicationController
  # POST /users
  # POST /users.xml
  def create
    @user_session = UserSession.new
    @user = User.new(params[:user])
    
    if (ENV["RAILS_ENV"] == "test" and @user.save) or @user.save_with_captcha
      UserMailer.activation(@user).deliver
      redirect_to(login_path, :notice => t("successfully_created", :scope => 'users.controller'))
    else
      render "user_sessions/new"
    end
  end
end
