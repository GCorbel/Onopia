FactoryGirl.define do
  factory :user do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:username){ |n| "guirec#{n}"}
    f.password "test"
    f.sequence(:email){ |n| "guirec.corbel#{n}@gmail.com"}
  end
end
