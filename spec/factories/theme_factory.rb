FactoryGirl.define do
  factory :bank do |f|
    f.sequence(:id) { |n| n}
    f.sequence(:label){ |n| "Credit Agricole#{n}"}
    f.sequence(:url){ |n| "http://www.google.com/#{n}"}
    f.sequence(:icon){ |n| "test#{n}.jpg"}
  end
end
