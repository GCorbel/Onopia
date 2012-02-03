def create_user(login)
  @current_user = User.find_by_username(login)
  unless @current_user
    @current_user = User.create!(
      :username => login,
      :password => 'generic',
      :email => "#{login}@example.com",
      :active => true
    )
  end
end

def login_user
  visit "/login"
  click_link "Connexion | Inscription"
  fill_in 'user_session_username', :with => @current_user.username
  fill_in 'user_session_password', :with => 'generic'
  click_button "Connexion"
  step %{I wait until all Ajax requests are complete}
end

def logout_user
  @current_user_session = nil
  @current_user = nil
  session = UserSession.find
  session.destroy if session
end

def user_session
  @session ||= UserSession.find
end

#
# Cucumber Assertions
#

Given /^I am the user "(.*)"$/ do |login|
  create_user login
end

Given /^I am logged in as "(.*)"$/ do |login|
  create_user login
  login_user
end

Given /^I am not logged in$/ do
  logout_user
end

When /^I Log In$/ do
  login_user
end

When /^I logout$/ do
  logout_user
end

Then /^there should be a session$/ do
  user_session
  @session.should_not be nil
end

Then /^there should not be a session$/ do
  user_session
  @session.should be nil
end

Then /^the user should be "([^"]*)"$/ do |login| #"
  user_session
  @session.user.login.should be == login
end
