# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'


describe "password reset", :js => true do
  self.use_transactional_fixtures = false
  
  context "when the user ask for a new password" do
    before(:each) do
      visit login_path
      click_link "Connexion | Inscription"
      click_link "Mot de passe oublié?"
    end
  
    it "show the form to remember the password" do
      page.should have_content "Rappel du mot de passe"
    end
    
    context "when valid data is supplied" do
      it "send and email" do
        user = Factory.create(:user)
        within(".new_user_reset_password") do
          fill_in "Email", :with => user.email
          click_button "Valider"
        end
        wait_for_ajax
        
        page.should have_content("Un email vous a été envoyé")
        page.should have_content("Veuillez suivre les instructions indiqués afin de modifier votre mot de passe")
        
        mailbox_for(user.email).size.should == 1
        email = open_email(user.email)
        url = "http://localhost:3000/user_reset_passwords"
        email.default_part_body.to_s.should include(url)
        
        new_user = User.find user.id
        new_user.perishable_token.should_not == user.perishable_token
      end
    end
    
    context "when invalid data is supplied" do
      it "show an error message" do
        within(".new_user_reset_password") do
          click_button "Valider"
        end
        wait_for_ajax
        
        page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
      end
    end
  end
  
  context "update the password" do
    before(:each) do
      user = Factory.create(:user)
      visit "/user_reset_passwords/#{user.perishable_token}/edit"
    end
    
    context "when valid data is supplied" do
      it "update the account" do
        within(".edit_user_reset_password") do
          fill_in "Mot de passe", :with => 'password'
          click_button "Modifier le mot de passe"
        end
        
        page.should have_content("Votre mot de passe a été modifié")
        page.should have_content("Vous pouvez, maintenant, vous connecter")
      end
    end
    
    context "when invalid data is supplied" do
      it "show error" do
        within(".edit_user_reset_password") do
          click_button "Modifier le mot de passe"
        end
        
        page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
      end
    end
  end
end
