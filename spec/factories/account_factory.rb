FactoryGirl.define do
  factory :account do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:login){ |n| "guirecc"}
    f.sequence(:password){ |n| "test1234"}
    f.sequence(:balance){ |n| n*100}
    association :bank, :factory => :bank
    association :user, :factory => :user
    association :account_type, :factory => :account_type
  end
end
