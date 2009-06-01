require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SportsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "sports", :action => "index").should == "/sports"
    end
  
    it "maps #new" do
      route_for(:controller => "sports", :action => "new").should == "/sports/new"
    end
  
    it "maps #show" do
      route_for(:controller => "sports", :action => "show", :id => "1").should == "/sports/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "sports", :action => "edit", :id => "1").should == "/sports/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "sports", :action => "create").should == {:path => "/sports", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "sports", :action => "update", :id => "1").should == {:path =>"/sports/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "sports", :action => "destroy", :id => "1").should == {:path =>"/sports/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/sports").should == {:controller => "sports", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/sports/new").should == {:controller => "sports", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/sports").should == {:controller => "sports", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/sports/1").should == {:controller => "sports", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/sports/1/edit").should == {:controller => "sports", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/sports/1").should == {:controller => "sports", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/sports/1").should == {:controller => "sports", :action => "destroy", :id => "1"}
    end
  end
end
