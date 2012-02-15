require File.dirname(__FILE__) + '/../spec_helper'

describe HomeController do
  fixtures :all
  render_views
  
  describe "#home" do
    
    context "when not logged" do
      it "should redirect to login" do
        get :index
        response.should redirect_to(login_url)
      end
    end
    
    context "when logged" do
      before(:each) do
        user = Factory.create(:user, :active => true)
        login_user user 
      end
      
      it "should render the home template" do
        get :index
        response.should render_template(:index)
      end
    end
  end
  
  describe '#login' do
    context "when not logged" do
      it "should render the login template" do
        get :login
        response.should render_template(:login)
      end
    end
    
    context "when logged" do
      before(:each) do
        user = Factory.create(:user, :active => true)
        login_user user 
      end
      
      it "should redirect to home" do
        get :login
        response.should redirect_to(root_url)
      end
    end
  end
end
