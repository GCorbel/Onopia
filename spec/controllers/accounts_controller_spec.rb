require File.dirname(__FILE__) + '/../spec_helper'

describe AccountsController do
  fixtures :all
  render_views
  
  setup :activate_authlogic
  
  before(:each) do
    @account = Factory.create(:account)
    user = Factory.create(:user, :active => true)
    login_user user 
  end

  it "new action should render new template" do
    get :new, :format => :js
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Account.any_instance.stubs(:valid?).returns(false)
    post :create, :format => :js
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Account.any_instance.stubs(:valid?).returns(true)
    Account.any_instance.stubs(:bank).returns(Factory.create(:bank))
    post :create, :format => :js
    response.should render_template(:create)
  end

  it "destroy action should destroy model and redirect to index action" do
    account = Account.first
    delete :destroy, :id => account, :format => :js
    response.should render_template(:destroy)
    Account.exists?(account.id).should be_false
  end
end
