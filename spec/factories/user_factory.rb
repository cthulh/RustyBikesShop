FactoryGirl.define do

	sequence(:email) { |n| "#{n}user@domain.com" }
	sequence(:password) { |n| "00000#{n}" }

	factory :user do
		
    password
    first_name "Peter"
    last_name "Example"
    admin false
    email

	end

	factory :another_user, class: User do

    password
    first_name "Another_Peter"
    last_name "Another_Example"
    admin false
		email

	end

	factory :admin_user, class: User do

    password
    first_name "Admin_Peter"
    last_name "Admin_Example"
    admin true
    email

	end
end