FactoryGirl.define do
  factory :account do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:login){ |n| "guirecc"}
    f.sequence(:password){ |n| "test1234"}
    f.sequence(:balance){ |n| n*100}
    account_type
  end
end
