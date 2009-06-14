require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Guide do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Guide.create!(@valid_attributes)
  end
end
