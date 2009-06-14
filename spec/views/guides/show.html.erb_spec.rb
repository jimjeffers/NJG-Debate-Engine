require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guides/show.html.erb" do
  include GuidesHelper
  before(:each) do
    assigns[:guide] = @guide = stub_model(Guide)
  end

  it "renders attributes in <p>" do
    render
  end
end

