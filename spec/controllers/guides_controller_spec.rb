require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuidesController do

  def mock_guide(stubs={})
    @mock_guide ||= mock_model(Guide, stubs)
  end
  
  describe "GET index" do
    it "assigns all guides as @guides" do
      Guide.should_receive(:find).with(:all).and_return([mock_guide])
      get :index
      assigns[:guides].should == [mock_guide]
    end
  end

  describe "GET show" do
    it "assigns the requested guide as @guide" do
      Guide.should_receive(:find).with("37").and_return(mock_guide)
      get :show, :id => "37"
      assigns[:guide].should equal(mock_guide)
    end
  end

  describe "GET new" do
    it "assigns a new guide as @guide" do
      Guide.should_receive(:new).and_return(mock_guide)
      get :new
      assigns[:guide].should equal(mock_guide)
    end
  end

  describe "GET edit" do
    it "assigns the requested guide as @guide" do
      Guide.should_receive(:find).with("37").and_return(mock_guide)
      get :edit, :id => "37"
      assigns[:guide].should equal(mock_guide)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created guide as @guide" do
        Guide.should_receive(:new).with({'these' => 'params'}).and_return(mock_guide(:save => true))
        post :create, :guide => {:these => 'params'}
        assigns[:guide].should equal(mock_guide)
      end

      it "redirects to the created guide" do
        Guide.stub!(:new).and_return(mock_guide(:save => true))
        post :create, :guide => {}
        response.should redirect_to(guide_url(mock_guide))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved guide as @guide" do
        Guide.stub!(:new).with({'these' => 'params'}).and_return(mock_guide(:save => false))
        post :create, :guide => {:these => 'params'}
        assigns[:guide].should equal(mock_guide)
      end

      it "re-renders the 'new' template" do
        Guide.stub!(:new).and_return(mock_guide(:save => false))
        post :create, :guide => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested guide" do
        Guide.should_receive(:find).with("37").and_return(mock_guide)
        mock_guide.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :guide => {:these => 'params'}
      end

      it "assigns the requested guide as @guide" do
        Guide.stub!(:find).and_return(mock_guide(:update_attributes => true))
        put :update, :id => "1"
        assigns[:guide].should equal(mock_guide)
      end

      it "redirects to the guide" do
        Guide.stub!(:find).and_return(mock_guide(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(guide_url(mock_guide))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested guide" do
        Guide.should_receive(:find).with("37").and_return(mock_guide)
        mock_guide.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :guide => {:these => 'params'}
      end

      it "assigns the guide as @guide" do
        Guide.stub!(:find).and_return(mock_guide(:update_attributes => false))
        put :update, :id => "1"
        assigns[:guide].should equal(mock_guide)
      end

      it "re-renders the 'edit' template" do
        Guide.stub!(:find).and_return(mock_guide(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested guide" do
      Guide.should_receive(:find).with("37").and_return(mock_guide)
      mock_guide.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the guides list" do
      Guide.stub!(:find).and_return(mock_guide(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(guides_url)
    end
  end

end
