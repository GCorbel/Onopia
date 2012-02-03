require File.dirname(__FILE__) + '/../spec_helper'

describe RecordsController do
  fixtures :all
  render_views
  
  it "update action should render nothing" do
    record = Factory.create(:record)
    put  :update, 
          :format => :js, 
          :id => record, 
          :record => {}
    response.body.should == " "
  end

  it "update action should update the record" do
    record = Factory.create(:record)
    category = Factory.create(:category)
    Record.any_instance.expects(:train_for).with(category)
    put  :update, 
          :format => :js, 
          :id => record, 
          :record => { :category_id => category.id}
  end
end
