Given /^a account exists for "([^"]*)"$/ do |username|
  user = User.find_by_username(username)
  account = Factory.create(:account)
  account.user = user
  account.save
end

