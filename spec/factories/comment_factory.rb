FactoryGirl.define do

	factory :comment do

		rating 1
		body "This is a comment"
		user
		product

	end

end