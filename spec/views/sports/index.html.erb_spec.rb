require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sports/index.html.erb" do
  include SportsHelper
  
  before(:each) do
    assigns[:sports] = [
      stub_model(Sport),
      stub_model(Sport)
    ]
  end

  it "renders a list of sports" do
    render
  end
end

