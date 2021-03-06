# require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
# 
# describe SportsController do
# 
#   def mock_sport(stubs={})
#     @mock_sport ||= mock_model(Sport, stubs)
#   end
#   
#   describe "GET index" do
#     it "assigns all sports as @sports" do
#       Sport.should_receive(:find).with(:all).and_return([mock_sport])
#       get :index
#       assigns[:sports].should == [mock_sport]
#     end
#   end
# 
#   describe "GET show" do
#     it "assigns the requested sport as @sport" do
#       Sport.should_receive(:find).with("37").and_return(mock_sport)
#       get :show, :id => "37"
#       assigns[:sport].should equal(mock_sport)
#     end
#   end
# 
#   describe "GET new" do
#     it "assigns a new sport as @sport" do
#       Sport.should_receive(:new).and_return(mock_sport)
#       get :new
#       assigns[:sport].should equal(mock_sport)
#     end
#   end
# 
#   describe "GET edit" do
#     it "assigns the requested sport as @sport" do
#       Sport.should_receive(:find).with("37").and_return(mock_sport)
#       get :edit, :id => "37"
#       assigns[:sport].should equal(mock_sport)
#     end
#   end
# 
#   describe "POST create" do
#     
#     describe "with valid params" do
#       it "assigns a newly created sport as @sport" do
#         Sport.should_receive(:new).with({'these' => 'params'}).and_return(mock_sport(:save => true))
#         post :create, :sport => {:these => 'params'}
#         assigns[:sport].should equal(mock_sport)
#       end
# 
#       it "redirects to the created sport" do
#         Sport.stub!(:new).and_return(mock_sport(:save => true))
#         post :create, :sport => {}
#         response.should redirect_to(sport_url(mock_sport))
#       end
#     end
#     
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved sport as @sport" do
#         Sport.stub!(:new).with({'these' => 'params'}).and_return(mock_sport(:save => false))
#         post :create, :sport => {:these => 'params'}
#         assigns[:sport].should equal(mock_sport)
#       end
# 
#       it "re-renders the 'new' template" do
#         Sport.stub!(:new).and_return(mock_sport(:save => false))
#         post :create, :sport => {}
#         response.should render_template('new')
#       end
#     end
#     
#   end
# 
#   describe "PUT update" do
#     
#     describe "with valid params" do
#       it "updates the requested sport" do
#         Sport.should_receive(:find).with("37").and_return(mock_sport)
#         mock_sport.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "37", :sport => {:these => 'params'}
#       end
# 
#       it "assigns the requested sport as @sport" do
#         Sport.stub!(:find).and_return(mock_sport(:update_attributes => true))
#         put :update, :id => "1"
#         assigns[:sport].should equal(mock_sport)
#       end
# 
#       it "redirects to the sport" do
#         Sport.stub!(:find).and_return(mock_sport(:update_attributes => true))
#         put :update, :id => "1"
#         response.should redirect_to(sport_url(mock_sport))
#       end
#     end
#     
#     describe "with invalid params" do
#       it "updates the requested sport" do
#         Sport.should_receive(:find).with("37").and_return(mock_sport)
#         mock_sport.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "37", :sport => {:these => 'params'}
#       end
# 
#       it "assigns the sport as @sport" do
#         Sport.stub!(:find).and_return(mock_sport(:update_attributes => false))
#         put :update, :id => "1"
#         assigns[:sport].should equal(mock_sport)
#       end
# 
#       it "re-renders the 'edit' template" do
#         Sport.stub!(:find).and_return(mock_sport(:update_attributes => false))
#         put :update, :id => "1"
#         response.should render_template('edit')
#       end
#     end
#     
#   end
# 
#   describe "DELETE destroy" do
#     it "destroys the requested sport" do
#       Sport.should_receive(:find).with("37").and_return(mock_sport)
#       mock_sport.should_receive(:destroy)
#       delete :destroy, :id => "37"
#     end
#   
#     it "redirects to the sports list" do
#       Sport.stub!(:find).and_return(mock_sport(:destroy => true))
#       delete :destroy, :id => "1"
#       response.should redirect_to(sports_url)
#     end
#   end
# 
# end
