# encoding: UTF-8

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
  
  def destroy
    @current_user_session.destroy
    @current_user.destroy
    redirect_to login_path, :notice => "Votre compte à été supprimé"
  end
  
  def update
    @user = User.find(params[:id])
      
    if @user.update_attributes(params[:user])
      render :json => { state: 'success', html: t("successfully_updated", :scope => 'users.controller')}
    else
      render_error_json(@user)
    end
  end
end
