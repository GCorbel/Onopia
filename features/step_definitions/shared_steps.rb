module UserHelpers
  def log_a_user(user)
    visit login_path
    fill_in 'user_session_username', :with => user.username
    fill_in 'user_session_password', :with => user.password
    click_button "Se connecter"
  end
  def user_session
    @session ||= UserSession.find
  end
  def current_user_session
    activate_authlogic
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    activate_authlogic
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
World(UserHelpers)


Given /^I am a logged user$/ do
  user = Factory.create(:user, :active => true)
  log_a_user(user)
end

When /^I wait until all Ajax requests are complete$/ do
  keep_looping = true
  while keep_looping do
    sleep 1
    begin
      count = page.evaluate_script('window.running_ajax_calls').to_i
      keep_looping = false if count == 0
    rescue => e
      if e.message.include? 'HTMLunitCorejsJavascript::Undefined'
        raise "For 'I wait for the AJAX call to finish' to work, please include culerity.js after including jQuery."
      else
        raise e
      end
    end
  end
end

Then /^I should see an error message$/ do
  page.should have_selector("div#errorExplanation")
end

Then /^show me the html$/ do
  puts page.html
end

Then /^I should be disconnected$/ do
  user_session.should == nil
end
