require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/guides/new.html.erb" do
  include GuidesHelper
  
  before(:each) do
    assigns[:guide] = stub_model(Guide,
      :new_record? => true
    )
  end

  it "renders new guide form" do
    render
    
    response.should have_tag("form[action=?][method=post]", guides_path) do
    end
  end
end


