# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'


describe "activate users", :js => true do
  self.use_transactional_fixtures = false

  context "when valid id is supplied" do
    it "activate a user" do
      user = Factory.create(:user, :username => 'Guirecc', :active => false)
      visit "/user_activates/new?id=#{user.perishable_token}"
              
      current_path.should == login_path
        
      new_user = User.find user.id
      new_user.should_not be_nil
                      
      page.should have_content("Votre compte a été activé.")
      page.should have_content("Vous pouvez vous connecter.")
      new_user.perishable_token.should_not == user.perishable_token
    end
  end

  context "when invalid id is supplied" do
    it "show an error message" do
      visit "/user_activates/new?id=11111"
      current_path.should == login_path
      page.should have_content("Une erreur s'est produite lors de l'activation de votre compte.")
    end
  end
end
