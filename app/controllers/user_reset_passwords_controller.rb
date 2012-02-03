# encoding: UTF-8
class UserResetPasswordsController < ApplicationController

  def create
    email = params[:user_reset_password][:email]
    @user_reset_password = User.find_by_email(email)
    if @user_reset_password
      @user_reset_password.reset_perishable_token!
      UserMailer.reset_password(@user_reset_password).deliver
    else
      @user_reset_password = User.new(:email => email)
      @user_reset_password.valid?
      if @user_reset_password.errors[:email].any?
        email_errors = @user_reset_password.errors[:email]
        @user_reset_password.errors.clear
        email_errors.each do | email_error |
          @user_reset_password.errors.add(:email, email_error)
        end
      else
        @user_reset_password.errors[:email] = "Votre adresse email est introuvable dans notre base de données."
      end
      render :new, :format => :js
    end
  end

  def new
    @user_reset_password = User.new
  end

  def edit
    @user = User.new
    @user_session = UserSession.new
    @user_reset_password = User.find_by_perishable_token params[:id]
    @show_user_reset_password = true
    render "home/login"
  end

  def update
    @user_reset_password = User.find_by_perishable_token params[:id]
    password = params[:user_reset_password][:password]
    
    if password.blank?
      @user_reset_password.errors.add(:email, "est requis")
      render :action => :edit, :format => :js
      return
    end
    
    if password.size < 4
      @user_reset_password.errors.add(:email, "est trop court (au moins 4 caractères)")
      render :action => :edit, :format => :js
      return
    end

    @user_reset_password.password = password
    if @user_reset_password.save
      render :update, :format => :js
    else
      render :edit, :format => :js
    end
  end
end
