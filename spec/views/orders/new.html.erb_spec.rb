require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/orders/new.html.erb" do
  include OrdersHelper
  
  before(:each) do
    assigns[:order] = stub_model(Order,
      :new_record? => true
    )
  end

  it "renders new order form" do
    render
    
    response.should have_tag("form[action=?][method=post]", orders_path) do
    end
  end
end


