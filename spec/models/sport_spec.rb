require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sport do
  before(:each) do
    @valid_attributes = {
      :name => 'football'
    }
  end

  it "should create a new instance given valid attributes" do
    Sport.create!(@valid_attributes)
  end
end
