FactoryGirl.define do
  factory :account_type do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:label){ |n| "Epargne"}
  end
end
