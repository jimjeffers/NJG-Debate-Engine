require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/images/edit.html.erb" do
  include ImagesHelper
  
  before(:each) do
    assigns[:image] = @image = stub_model(Image,
      :new_record? => false
    )
  end

  it "renders the edit image form" do
    render
    
    response.should have_tag("form[action=#{image_path(@image)}][method=post]") do
    end
  end
end


