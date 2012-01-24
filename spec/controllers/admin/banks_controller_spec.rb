require File.dirname(__FILE__) + '/../../spec_helper'
module ::Admin
  describe BanksController do
    fixtures :all
    render_views
    
    before(:each) do
      Factory.create(:bank)
    end

    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => Bank.first
      response.should render_template(:show)
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      Bank.any_instance.stubs(:valid?).returns(false)
      post :create
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      Bank.any_instance.stubs(:valid?).returns(true)
      post :create
      response.should redirect_to(bank_url(assigns[:bank]))
    end

    it "edit action should render edit template" do
      get :edit, :id => Bank.first
      response.should render_template(:edit)
    end

    it "update action should render edit template when model is invalid" do
      Bank.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Bank.first
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      Bank.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Bank.first
      response.should redirect_to(bank_url(assigns[:bank]))
    end

    it "destroy action should destroy model and redirect to index action" do
      bank = Bank.first
      delete :destroy, :id => bank
      response.should redirect_to(banks_url)
      Bank.exists?(bank.id).should be_false
    end
  end
end
