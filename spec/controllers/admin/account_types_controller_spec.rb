require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::AccountTypesController do
  fixtures :all
  render_views
    
  before(:each) do
    Factory.create(:account_type)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => AccountType.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    AccountType.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    AccountType.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_account_type_url(assigns[:account_type]))
  end

  it "edit action should render edit template" do
    get :edit, :id => AccountType.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    AccountType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AccountType.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    AccountType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AccountType.first
    response.should redirect_to(admin_account_type_url(assigns[:account_type]))
  end

  it "destroy action should destroy model and redirect to index action" do
    account_type = AccountType.first
    delete :destroy, :id => account_type
    response.should redirect_to(admin_account_types_url)
    AccountType.exists?(account_type.id).should be_false
  end
end
