require 'spec_helper'

describe 'home page' do

  context 'we fill the form for sign up' do
  
    before do 
      visit '/'
    end
    
    it 'should work with valid information' do
      fill_in "Email", :with => "dougui_bzh@hotmail.com"
      fill_in "Pseudo", :with => "dougui"
      fill_in "Mot de passe", :with => "test1234"
      
      click_button "Valider"
      
      URI.parse(current_url).path == "/"
    end
    
    it 'should not work with invalid information' do
      click_button "Valider"
      
      page.should have_selector("div#errorExplanation")
    end 
  end
  
end

