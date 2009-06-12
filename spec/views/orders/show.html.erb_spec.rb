require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/orders/show.html.erb" do
  include OrdersHelper
  before(:each) do
    assigns[:order] = @order = stub_model(Order)
  end

  it "renders attributes in <p>" do
    render
  end
end

