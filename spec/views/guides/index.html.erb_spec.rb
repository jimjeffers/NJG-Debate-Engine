require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guides/index.html.erb" do
  include GuidesHelper
  
  before(:each) do
    assigns[:guides] = [
      stub_model(Guide),
      stub_model(Guide)
    ]
  end

  it "renders a list of guides" do
    render
  end
end

