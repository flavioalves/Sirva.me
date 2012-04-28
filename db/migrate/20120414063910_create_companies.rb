class CreateCompanies < ActiveRecord::Migration
  def change
  	create_table :companies do |t|
  		t.string  :name
  		t.string  :phone
  		t.string  :address
  		t.string  :segments
  		t.string  :products
  		t.boolean :plus, default: false

  		t.timestamps
  	end
  end
end