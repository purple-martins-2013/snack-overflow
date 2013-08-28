FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "seth#{n}" }
    sequence(:email) {|n| "seth#{n}@seth.com" }
    password_hash 'password'
  end

  factory :answer do
    sequence(:content) {|n| "Answer #{n}"}
    sequence(:score) { rand(10) }
  end
end
