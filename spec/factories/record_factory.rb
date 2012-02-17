FactoryGirl.define do
  factory :record do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:label){ |n| "label#{n}"}
    f.sequence(:amount){ |n| n}
    date Date.today
    association :account, :factory => :account
  end
end
