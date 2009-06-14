require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guides/edit.html.erb" do
  include GuidesHelper
  
  before(:each) do
    assigns[:guide] = @guide = stub_model(Guide,
      :new_record? => false
    )
  end

  it "renders the edit guide form" do
    render
    
    response.should have_tag("form[action=#{guide_path(@guide)}][method=post]") do
    end
  end
end


