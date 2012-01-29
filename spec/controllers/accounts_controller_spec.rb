require File.dirname(__FILE__) + '/../spec_helper'

describe AccountsController do
  fixtures :all
  render_views
  
  before(:each) do
    @account = Factory.create(:account)
  end
  
  def connect_user
    user_session = UserSession.new
    UserSession.stubs(:find).returns(user_session)
    UserSession.any_instance.stubs(:record).returns(@account.user)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Account.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :format => :js
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    connect_user
    Account.any_instance.stubs(:valid?).returns(false)
    post :create, :format => :js
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    connect_user
    Account.any_instance.stubs(:valid?).returns(true)
    Account.any_instance.stubs(:bank).returns(Factory.create(:bank))
    post :create, :format => :js
    response.should render_template(:create)
  end

  it "edit action should render edit template" do
    get :edit, :id => Account.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Account.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Account.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Account.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Account.first
    response.should redirect_to(account_url(assigns[:account]))
  end

  it "destroy action should destroy model and redirect to index action" do
    connect_user
    account = Account.first
    delete :destroy, :id => account, :format => :js
    response.should render_template(:destroy)
    Account.exists?(account.id).should be_false
  end
end
