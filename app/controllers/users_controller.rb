class UsersController < ApplicationController
  # POST /users
  # POST /users.xml
  def create
    @user_session = UserSession.new
    @user = User.new(params[:user])
    
    if (ENV["RAILS_ENV"] == "test" and @user.save) or @user.save_with_captcha
      UserMailer.activation(@user).deliver
      render :json => { state: 'success', html: t("successfully_created", :scope => 'users.controller')}
    else
      html = render_to_string( :partial => "shared/error_messages", :locals => { :target => @user } )
      render :json => { state: 'error', html: html}
    end
  end
end
