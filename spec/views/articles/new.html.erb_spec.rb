require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/articles/new.html.erb" do
  include ArticlesHelper
  
  before(:each) do
    assigns[:article] = stub_model(Article,
      :new_record? => true
    )
  end

  it "renders new article form" do
    render
    
    response.should have_tag("form[action=?][method=post]", articles_path) do
    end
  end
end


