When /^There is an empty an empty database$/ do
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
  page.should have_selector("div#errorExplanation")
end

Then /^show me the html$/ do
  puts page.html
end

Then /^I should be disconnected$/ do
  user_session.should == nil
end
