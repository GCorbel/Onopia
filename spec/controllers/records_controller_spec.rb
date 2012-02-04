require File.dirname(__FILE__) + '/../spec_helper'

describe RecordsController do
  fixtures :all
  render_views
  
  before(:each) do
    @record = Factory.create(:record)
    @category = Factory.create(:category)
    Record.bayesian_system = nil
  end
  
  it "should update action should render nothing" do
    put  :update, 
          :format => :js, 
          :id => @record, 
          :record => {}
    response.body.should == " "
  end

  it "should update action should update the record" do
    Record.any_instance.expects(:train_for).with(@category)
    put  :update, 
          :format => :js, 
          :id => @record, 
          :record => { :category_id => @category.id}
  end
  
  it "should save the modifications" do
    Record.any_instance.expects(:save).returns(true)
    put  :update, 
          :format => :js, 
          :id => @record, 
          :record => { :category_id => @category.id}
  end
end
