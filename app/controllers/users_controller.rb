class UsersController < ApplicationController
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    if (ENV["RAILS_ENV"] == "test" and @user.save) or @user.save_with_captcha
      UserMailer.activation(@user).deliver
      render :json => { state: 'success', html: t("successfully_created", :scope => 'users.controller')}
    else
      render_error_json(@user)
    end
  end
end
