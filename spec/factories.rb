FactoryGirl.define do
	factory :company do
		name     'Company Name'
		phone    '24 2452 2222'
		address  'Company Address, 11, 111'
		segments 'Segment, List'
		products 'product, tags'
		plus     false
	end
end