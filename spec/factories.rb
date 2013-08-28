FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "seth#{n}" }
    sequence(:email) {|n| "seth#{n}@seth.com" }
  end
end
