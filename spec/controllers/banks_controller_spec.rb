require File.dirname(__FILE__) + '/../spec_helper'

describe BanksController do
  fixtures :all
  render_views
  
  before(:each) do
    @bank = Factory.create(:bank)
  end

  it "index action should render index template" do
    get :index, :format => :js
    response.should render_template(:index)
  end

  it "index action should give the list of banks when it have a research" do
    get :index, :format => :js, :bank => { :label => "Credit"}
    response.should render_template(:index)
    assigns[:banks].should == [@bank]
  end

  it "index action should give an empty list when there is no research" do
    get :index, :format => :js
    response.should render_template(:index)
    assigns[:banks].should == []
  end

  it "index action should give the list of banks who have the first letter when we search only one char" do
    get :index, :format => :js, :bank => { :label => "C"}
    response.should render_template(:index)
    assigns[:banks].should == [@bank]
    
    get :index, :format => :js, :bank => { :label => "r"}
    response.should render_template(:index)
    assigns[:banks].should == []
  end
end
