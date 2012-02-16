require File.dirname(__FILE__) + '/../spec_helper'

describe Theme do
  it { should have_many(:users) }
  
  it { should allow_mass_assignment_of(:label) }
  it { should allow_mass_assignment_of(:url) }
end
