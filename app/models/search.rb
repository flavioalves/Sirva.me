# encoding: utf-8
class Search < ActiveRecord::Base
	attr_accessible :terms
	validates :terms, presence: true

	class << self
		def bring_me_results_for(term_list = nil)
			if term_list = filter_terms(term_list)
				create terms: term_list

				where = []
				terms = []

				term_list.split(', ').each do |t|
					where << "#{tra('name')} like #{tra("?")}"
					where << "#{tra('segments')} like #{tra("?")}"
					where << "#{tra('products')} like #{tra("?")}"
					3.times { terms << "%#{t.downcase}%" }
				end

				Company.where(where.join(' or '), *terms).all
			else
				Company.random(12)
			end
		end

		private
			def filter_terms(terms = nil)
				(terms = terms.try(:split, ', ')) ? (terms - %w(e da das de do dos)).join(', ') : nil
			end

		  def tra(value)
		    %{translate(lower(#{value}),'âãäåāăąèééêëēĕėęěìíîïìĩīĭóôõöōŏőùúûüũūŭůçćčĉċ','aaaaaaaeeeeeeeeeeiiiiiiiiooooooouuuuuuuccccc')}
		  end
	end
end