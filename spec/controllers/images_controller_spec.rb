require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImagesController do

  def mock_image(stubs={})
    @mock_image ||= mock_model(Image, stubs)
  end
  
  describe "GET index" do
    it "assigns all images as @images" do
      Image.should_receive(:find).with(:all).and_return([mock_image])
      get :index
      assigns[:images].should == [mock_image]
    end
  end

  describe "GET show" do
    it "assigns the requested image as @image" do
      Image.should_receive(:find).with("37").and_return(mock_image)
      get :show, :id => "37"
      assigns[:image].should equal(mock_image)
    end
  end

  describe "GET new" do
    it "assigns a new image as @image" do
      Image.should_receive(:new).and_return(mock_image)
      get :new
      assigns[:image].should equal(mock_image)
    end
  end

  describe "GET edit" do
    it "assigns the requested image as @image" do
      Image.should_receive(:find).with("37").and_return(mock_image)
      get :edit, :id => "37"
      assigns[:image].should equal(mock_image)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created image as @image" do
        Image.should_receive(:new).with({'these' => 'params'}).and_return(mock_image(:save => true))
        post :create, :image => {:these => 'params'}
        assigns[:image].should equal(mock_image)
      end

      it "redirects to the created image" do
        Image.stub!(:new).and_return(mock_image(:save => true))
        post :create, :image => {}
        response.should redirect_to(image_url(mock_image))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved image as @image" do
        Image.stub!(:new).with({'these' => 'params'}).and_return(mock_image(:save => false))
        post :create, :image => {:these => 'params'}
        assigns[:image].should equal(mock_image)
      end

      it "re-renders the 'new' template" do
        Image.stub!(:new).and_return(mock_image(:save => false))
        post :create, :image => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested image" do
        Image.should_receive(:find).with("37").and_return(mock_image)
        mock_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :image => {:these => 'params'}
      end

      it "assigns the requested image as @image" do
        Image.stub!(:find).and_return(mock_image(:update_attributes => true))
        put :update, :id => "1"
        assigns[:image].should equal(mock_image)
      end

      it "redirects to the image" do
        Image.stub!(:find).and_return(mock_image(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(image_url(mock_image))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested image" do
        Image.should_receive(:find).with("37").and_return(mock_image)
        mock_image.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :image => {:these => 'params'}
      end

      it "assigns the image as @image" do
        Image.stub!(:find).and_return(mock_image(:update_attributes => false))
        put :update, :id => "1"
        assigns[:image].should equal(mock_image)
      end

      it "re-renders the 'edit' template" do
        Image.stub!(:find).and_return(mock_image(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      Image.should_receive(:find).with("37").and_return(mock_image)
      mock_image.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the images list" do
      Image.stub!(:find).and_return(mock_image(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(images_url)
    end
  end

end
