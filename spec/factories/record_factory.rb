FactoryGirl.define do
  factory :record do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:label){ |n| "label#{n}"}
    association :account, :factory => :account
  end
end
