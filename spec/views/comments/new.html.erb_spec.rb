require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true
    )
  end

  it "renders new comment form" do
    render
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
    end
  end
end


