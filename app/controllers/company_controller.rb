class CompanyController < ApplicationController
  def index
    search_params = normalize_search_params params[:encontrar]
    @companies    = Search.bring_me_results_for search_params

  	respond_to do |f|
  		f.html
  		f.js   { render partial: 'search_results'   }
  		f.json { render json:    @companies.to_json }
  	end
  end
end