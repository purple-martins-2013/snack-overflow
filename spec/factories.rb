FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "seth#{n}" }
    sequence(:email) {|n| "seth#{n}@example.com" }
    password 'password'
  end

  factory :answer do
    sequence(:content) {|n| "Answer #{n}. Second line."}
  end

  factory :question do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:content) {|n| "Content #{n}"}
    user
  end
end
