require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/new.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = stub_model(Image,
      :new_record? => true
    )
  end

  it "renders new image form" do
    render
    
    response.should have_tag("form[action=?][method=post]", images_path) do
    end
  end
end


