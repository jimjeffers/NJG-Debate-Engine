require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false
    )
  end

  it "renders the edit comment form" do
    render
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
    end
  end
end


