# encoding: UTF-8

class UsersController < ApplicationController
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    if (ENV["RAILS_ENV"] == "test" and @user.save) or @user.save_with_captcha
      UserMailer.activation(@user).deliver
    else
      render :new
    end
  end
  
  def destroy
    @current_user_session.destroy
    @current_user.destroy
    redirect_to login_path, :notice => "Votre compte à été supprimé"
  end
  
  def update
    @user = User.find(params[:id])
      
    unless @user.update_attributes(params[:user])
      render :edit
    end
  end
  
  def update_theme
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to configuration_path
  end
end
