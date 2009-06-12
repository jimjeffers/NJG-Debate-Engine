require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Order do
  before(:each) do
    @valid_attributes = {
      :verification_number => '123', 
      :card_number => '4344343434343434343', 
      :card_type => 'MC', 
      :expiration_month => '04', 
      :expiration_year => '09'
    }
  end

  it "should create a new instance given valid attributes" do
    Order.create!(@valid_attributes)
  end
end
