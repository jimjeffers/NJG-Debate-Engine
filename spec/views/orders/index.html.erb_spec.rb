require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/orders/index.html.erb" do
  include OrdersHelper
  
  before(:each) do
    assigns[:orders] = [
      stub_model(Order),
      stub_model(Order)
    ]
  end

  it "renders a list of orders" do
    render
  end
end

