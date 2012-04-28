class Company < ActiveRecord::Base
	attr_accessible :name, :phone, :address, :segments, :products, :plus, as: :admin
	validates :name, :phone, :segments, presence: true
end