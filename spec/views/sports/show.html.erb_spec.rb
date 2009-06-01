require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sports/show.html.erb" do
  include SportsHelper
  before(:each) do
    assigns[:sport] = @sport = stub_model(Sport)
  end

  it "renders attributes in <p>" do
    render
  end
end

