require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comments] = [
      stub_model(Comment),
      stub_model(Comment)
    ]
  end

  it "renders a list of comments" do
    render
  end
end

