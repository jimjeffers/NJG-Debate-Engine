require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sports/new.html.erb" do
  include SportsHelper
  
  before(:each) do
    assigns[:sport] = stub_model(Sport,
      :new_record? => true
    )
  end

  it "renders new sport form" do
    render
    
    response.should have_tag("form[action=?][method=post]", sports_path) do
    end
  end
end


