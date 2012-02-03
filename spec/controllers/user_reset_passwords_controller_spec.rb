# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'

describe UserResetPasswordsController do
  fixtures :all
  render_views
  
  before(:each) do
    @user = Factory.create(:user)
  end

  it "create action should render new template when email is invalid" do
    post  :create, 
          :format => :js, 
          :user_reset_password => {:email => "test1234@test.com"}
    response.should render_template(:new)
    Object.const_defined?(:User).should be_true
  end

  it "create action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    
    post  :create, 
          :format => :js, 
          :user_reset_password => {:email => @user.email}
    response.should render_template(:create)
  end
  
  it "should reset the perishable token when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    
    token = User.first.perishable_token
    
    post  :create, 
          :format => :js, 
          :user_reset_password => {:email => @user.email}
          
    token.should_not == User.first.perishable_token
  end
  
  it "create action should send an email when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    
    post  :create, 
          :format => :js, 
          :user_reset_password => {:email => User.first.email}
          
    open_email(User.first.email)
    current_email.should have_subject("Réinitialisation de votre mot de passe")
    current_email.default_part_body.to_s.should include("http://localhost:3000/user_reset_passwords/#{User.first.perishable_token}/edit")
  end

  it "new action should render new template" do
    get :new, :format => :js
    response.should render_template(:new)
    Object.const_defined?(:User).should be_true
  end

  it "edit action should render edit template" do
    get :edit, :id => @user
    response.should render_template("home/login")
  end

  it "update action should render edit template when password is empty" do
    User.any_instance.stubs(:valid?).returns(true)
    put :update, 
        :format => :js,
        :id => @user.perishable_token,
        :user_reset_password => {
          :password => ""
        }
    response.should render_template("edit")
  end

  it "update action should render edit template when password is too short" do
    User.any_instance.stubs(:valid?).returns(true)
    put :update, 
        :format => :js,
        :id => @user.perishable_token,
        :user_reset_password => {
          :password => "ab"
        }
    response.should render_template("edit")
  end

  it "update action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    put :update, 
        :format => :js,
        :id => @user.perishable_token,
        :user_reset_password => {
          :password => "test1234"
        }
    response.should render_template("update")
  end
end
