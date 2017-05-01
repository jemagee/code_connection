FactoryGirl.define do
  factory :user do
    sequence(:email)  {|n| "test#{n}@email.com"}
    password "Password"
    sequence(:username) {|n| "user_name#{n}"}

    trait :admin do
    	admin true
    end
  end
end
