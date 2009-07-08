require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ImagesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "images", :action => "index").should == "/images"
    end
  
    it "maps #new" do
      route_for(:controller => "images", :action => "new").should == "/images/new"
    end
  
    it "maps #show" do
      route_for(:controller => "images", :action => "show", :id => "1").should == "/images/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "images", :action => "edit", :id => "1").should == "/images/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "images", :action => "create").should == {:path => "/images", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "images", :action => "update", :id => "1").should == {:path =>"/images/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "images", :action => "destroy", :id => "1").should == {:path =>"/images/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/images").should == {:controller => "images", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/images/new").should == {:controller => "images", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/images").should == {:controller => "images", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/images/1").should == {:controller => "images", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/images/1/edit").should == {:controller => "images", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/images/1").should == {:controller => "images", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/images/1").should == {:controller => "images", :action => "destroy", :id => "1"}
    end
  end
end
