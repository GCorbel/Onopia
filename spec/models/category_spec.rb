require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  it { should have_many(:records) }
  it { should validate_presence_of(:label) }
  it { should allow_mass_assignment_of(:label) }
end
