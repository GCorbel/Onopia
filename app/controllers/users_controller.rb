class UsersController < ApplicationController
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.save_with_captcha
      UserMailer.activation(@user).deliver
      redirect_to(login_path, :notice => t("successfully_created", :scope => 'users.controller'))
    else
      render "home/index"
    end
  end
end
