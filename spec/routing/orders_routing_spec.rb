require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OrdersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "orders", :action => "index").should == "/orders"
    end
  
    it "maps #new" do
      route_for(:controller => "orders", :action => "new").should == "/orders/new"
    end
  
    it "maps #show" do
      route_for(:controller => "orders", :action => "show", :id => "1").should == "/orders/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "orders", :action => "edit", :id => "1").should == "/orders/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "orders", :action => "create").should == {:path => "/orders", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "orders", :action => "update", :id => "1").should == {:path =>"/orders/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "orders", :action => "destroy", :id => "1").should == {:path =>"/orders/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/orders").should == {:controller => "orders", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/orders/new").should == {:controller => "orders", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/orders").should == {:controller => "orders", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/orders/1").should == {:controller => "orders", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/orders/1/edit").should == {:controller => "orders", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/orders/1").should == {:controller => "orders", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/orders/1").should == {:controller => "orders", :action => "destroy", :id => "1"}
    end
  end
end
