Given /^I have no user$/ do
  User.delete_all
end

When /^I disactive the account (.*)$/ do |username|
  user = User.find_by_username(username)
  user.active = false
  user.save
end
