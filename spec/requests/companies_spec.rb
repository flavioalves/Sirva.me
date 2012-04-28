require 'spec_helper'

describe "Home Page" do
	before do
		FactoryGirl.create(:company, segments: 'Movies', products: 'dvds')
		visit root_path
	end

	describe "visit root path" do
		it "should display search results if exist some company" do
			page.should have_content('Company Name')
			page.should have_content('Movies [dvds]')
		end
	end

	describe "perform company search" do
		context "using ajax", js: true do
			it "should display 'not found' message if none companies found" do
				fill_in 'search-field', with: 'coffee, fruit'
				click_button 'submit-search'

				page.should have_no_selector(:xpath, './/li[@class="result"]')
				page.should have_selector(:xpath, './/li[@id="none-companies"]')
			end

			it "should display search results if companies found" do
				fill_in 'search-field', with: 'movies, dvds'
				click_button 'submit-search'

				page.should have_content('Company Name')
				page.should have_content('Movies [dvds]')
			end
		end

		context "without using ajax" do
			it "should display 'not found' message if none companies found" do
				fill_in 'search-field', with: 'coffee, fruit'
				click_button 'submit-search'

				page.should have_no_selector(:xpath, './/li[@class="result"]')
				page.should have_selector(:xpath, './/li[@id="none-companies"]')
			end

			it "should display search results if companies found" do
				fill_in 'search-field', with: 'movies, dvds'
				click_button 'submit-search'

				page.should have_content('Company Name')
				page.should have_content('Movies [dvds]')
			end
		end
	end
end