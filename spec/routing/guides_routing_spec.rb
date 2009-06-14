require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuidesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "guides", :action => "index").should == "/guides"
    end
  
    it "maps #new" do
      route_for(:controller => "guides", :action => "new").should == "/guides/new"
    end
  
    it "maps #show" do
      route_for(:controller => "guides", :action => "show", :id => "1").should == "/guides/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "guides", :action => "edit", :id => "1").should == "/guides/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "guides", :action => "create").should == {:path => "/guides", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "guides", :action => "update", :id => "1").should == {:path =>"/guides/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "guides", :action => "destroy", :id => "1").should == {:path =>"/guides/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/guides").should == {:controller => "guides", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/guides/new").should == {:controller => "guides", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/guides").should == {:controller => "guides", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/guides/1").should == {:controller => "guides", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/guides/1/edit").should == {:controller => "guides", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/guides/1").should == {:controller => "guides", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/guides/1").should == {:controller => "guides", :action => "destroy", :id => "1"}
    end
  end
end
