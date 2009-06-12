require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/orders/edit.html.erb" do
  include OrdersHelper
  
  before(:each) do
    assigns[:order] = @order = stub_model(Order,
      :new_record? => false
    )
  end

  it "renders the edit order form" do
    render
    
    response.should have_tag("form[action=#{order_path(@order)}][method=post]") do
    end
  end
end


