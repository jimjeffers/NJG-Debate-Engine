require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/show.html.erb" do
  include ImagesHelper
  before(:each) do
    assigns[:image] = @image = stub_model(Image)
  end

  it "renders attributes in <p>" do
    render
  end
end

