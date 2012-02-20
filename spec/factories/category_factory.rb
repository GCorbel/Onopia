FactoryGirl.define do
  factory :category do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:label){ |n| "category#{n}"}
  end
end
