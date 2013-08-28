FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "seth#{n}" }
    sequence(:email) {|n| "seth#{n}@seth.com" }
    password 'password'
  end

  factory :answer do
    sequence(:content) {|n| "Answer #{n}"}
  end
end
