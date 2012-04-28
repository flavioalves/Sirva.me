require 'spec_helper'

describe CompanyController do
	render_views

	describe "GET index" do
		let!(:company) { FactoryGirl.create(:company, products: 'coffee') }
		let!(:company1) { FactoryGirl.create(:company, products: 'fruit, juice') }

		context "with search params" do
			it "should assign a array on companies with results" do
				get :index, encontrar: 'coffee'
				assigns(:companies).should be_a(Array)
				assigns(:companies).first.should be_a(Company)
			end

			xit "should return companies ordered by relevance" do
				get :index, encontrar: 'coffee+fruit+juice'
				assigns(:companies).should == [company1, company]
			end

			it "should assign a array on companies without results" do
				get :index, encontrar: 'icecream'
				assigns(:companies).should be_a(Array)
				assigns(:companies).should be_empty
			end
		end

		context "without search params" do
			it "should assign a array on companies with random results" do
				get :index
				assigns(:companies).should be_a(Array)
				assigns(:companies).first.should be_a(Company)
			end
		end

		describe "rendering" do
			it "should return success" do
				get :index
				response.should be_success
			end

			it "should render search results with layout" do
				get :index, format: :html
				response.should render_template('search_results')
				response.should render_with_layout('application')
			end

			it "should render search results without layout" do
				get :index, format: :js
				response.should render_template('search_results')
				response.should_not render_with_layout('application')
			end

			it "should render search results as json" do
				get :index, format: :json
				response.body.should =~ /\"address\"\:\"Company Address\, 11\, 111\"/
			end
		end
	end
end