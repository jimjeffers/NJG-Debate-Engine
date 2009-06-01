require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sports/edit.html.erb" do
  include SportsHelper
  
  before(:each) do
    assigns[:sport] = @sport = stub_model(Sport,
      :new_record? => false
    )
  end

  it "renders the edit sport form" do
    render
    
    response.should have_tag("form[action=#{sport_path(@sport)}][method=post]") do
    end
  end
end


