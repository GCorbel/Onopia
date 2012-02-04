# encoding: UTF-8
When /^I have a clean database$/ do
  User.destroy_all
  Account.destroy_all
  AccountType.destroy_all
  Bank.destroy_all
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
  page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
end

Then /^show me the html$/ do
  puts page.html
end

Then /^I should be disconnected$/ do
  user_session.should == nil
end

Then /^debug$/ do
  debugger
end

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept 
  step %{I wait until all Ajax requests are complete}   
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
  step %{I wait until all Ajax requests are complete}   
end

When /^I wait (\d+) seconds?/ do |time|
  sleep(time.to_i) 
end

When /^I wait for "([^"]*)"$/ do |element|
  keep_looping = true
  while keep_looping do
    sleep 1
    keep_looping = false if page.has_css?(element)
  end
end
