# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :first_name do |n|
    "first_name_#{n}"
  end

  sequence :last_name do |n|
    "last_name_#{n}"
  end

  sequence :email do |n|
    "email_#{n}@example.com"
  end

  sequence :password do |n|
    "password_#{n}"
  end

  factory :user do
    first_name
    last_name
    email
    password
  end
end
