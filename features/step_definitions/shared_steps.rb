Then /^I should see an error message$/ do
  page.should have_selector("div#errorExplanation")
end
