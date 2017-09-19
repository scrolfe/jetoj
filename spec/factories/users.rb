FactoryGirl.define do
  factory :user do
    email "test@user.com"
    password "foobar"
    username "testuser"
    first_name "Test"
    last_name "User"
    admin true
  end
end
