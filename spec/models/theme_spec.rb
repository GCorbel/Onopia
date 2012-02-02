require File.dirname(__FILE__) + '/../spec_helper'

describe Theme do
  it "should be valid" do
    Theme.new.should be_valid
  end
end
