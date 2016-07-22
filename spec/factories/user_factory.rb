FactoryGirl.define do

	sequence(:email) { |n| "#{n}user000@domain.com" }

	factory :user do
			
	  password "123456"
	  first_name "Peter"
	  last_name "Example"
	  admin false
	  email 

	  factory :another_user, class: User do

			email

		end

		factory :admin_user, class: User do

			admin true
			email

		end

	end

end