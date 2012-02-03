Given /^I load the file for "([^"]*)" with bank "([^"]*)" and type "([^"]*)"$/ do |user_name, bank_label, type_label| 
  Dir["#{Rails.root}/lib/**/*.rb"].each { |f| load f }
  user = User.find_by_username(user_name)
  account = user.accounts.first
  account.type.label = type_label
  account.bank.label = bank_label
  BankReader::Reader.read(account)
  
  category = Factory.create(:category)
  account.records.each do |record|
    record.category = category
    record.save
  end
end

Given /^"([^"]*)" have an account$/ do |username|
  user = User.find_by_username(username)
  account = Factory.create(:account)
  account.user = user
  account.save
end

When /^I select "([^"]*)" from "([^"]*)" for the first record of "([^"]*)"$/ do |value, field, username|
  user = User.find_by_username(username)
  record = user.records.first
  select(value, :from => "category_id_#{record.id}")
end

Then /^the category for first record for "([^"]*)" should be "([^"]*)"$/ do |username, category|
  user = User.find_by_username(username)
  user.records.first.category.label.should == category
end

