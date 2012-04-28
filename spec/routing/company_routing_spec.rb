require 'spec_helper'

describe CompanyController do
  describe "routing" do
    it "should root path routes to index" do
      get('/').should route_to('company#index')
      root_path.should == '/'
    end

    it "should search path routes to index" do
      get('/encontrar').should route_to('company#index')
    end
  end
end