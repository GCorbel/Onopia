# encoding: UTF-8
Given /^I have no user$/ do
  User.delete_all
end

Given /^I view the new user reset password form$/ do
  steps %Q{
    Given a user exists with username: "Guirecc", email: "guirec.corbel@gmail.com"
    And I am on the login page
    And no emails have been sent
    When I go to the login page
    And I follow "Connexion | Inscription"
    And I follow "Mot de passe oublié?"
  }
end

When /^I disactive the account (.*)$/ do |username|
  user = User.find_by_username(username)
  user.active = false
  user.save
end

