require "spec_helper"

describe MusiciansController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/musicians" }.should route_to(:controller => "musicians", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/musicians/new" }.should route_to(:controller => "musicians", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/musicians/1" }.should route_to(:controller => "musicians", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/musicians/1/edit" }.should route_to(:controller => "musicians", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/musicians" }.should route_to(:controller => "musicians", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/musicians/1" }.should route_to(:controller => "musicians", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/musicians/1" }.should route_to(:controller => "musicians", :action => "destroy", :id => "1")
    end

  end
end
