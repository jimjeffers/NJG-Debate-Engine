# require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
# 
# describe "/articles/edit.html.erb" do
#   include ArticlesHelper
#   
#   before(:each) do
#     assigns[:article] = @article = stub_model(Article,
#       :new_record? => false
#     )
#   end
# 
#   it "renders the edit article form" do
#     render
#     
#     response.should have_tag("form[action=#{article_path(@article)}][method=post]") do
#     end
#   end
# end
# 
# 
