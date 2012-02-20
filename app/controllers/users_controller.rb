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
  
  def amounts
    @date_start = Date.parse(params[:stats][:date_start])
    @date_end = Date.parse(params[:stats][:date_end])
    @options = {}
    @options = params[:stats][:options] if params[:stats][:options]
    data = @current_user.amounts(@date_start, @date_end, @options)
    render :json => data
  end
  
  def records
    records = @current_user.records
                          .joins(:category)
                          .select("records.*, categories.label as category_label")
                          .search(params[:search])
    result = records.all.collect{ |r| [r.date,r.label,r.amount,r.category_label]}
    render :json => {
      :aaData => result
    }
  end
end
