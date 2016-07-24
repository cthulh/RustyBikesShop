FactoryGirl.define do
  # generate email addresses
  sequence(:email) { |n| "#{n}user@domain.com" }

  factory :user do
    password '123456'
    first_name 'Peter'
    last_name 'Example'
    admin false
    email

    # another user with a different email address
    factory :another_user, class: User do
      email
    end

    # admin user with different email address and admin set to true
    factory :admin_user, class: User do
      admin true
      email
    end
  end
end
