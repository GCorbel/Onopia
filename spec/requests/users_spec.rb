# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'


describe "registration feature", :js => true do
  self.use_transactional_fixtures = false
  
  describe "registration of a user" do
    before(:each) do
      @user = Factory.build(:user)
      visit login_path
      click_link "Connexion | Inscription"
    end
    
    context "when supplied data is valid" do
      it "sign up user" do
        within("#new_user") do
          fill_in "Pseudo", :with => @user.username
          fill_in "Email", :with =>  @user.email
          fill_in "Mot de passe", :with => 'password'
          click_button "Valider"
        end
        wait_for_ajax
        
        page.should have_content("Vous avez été enregistré.")
        page.should have_content("Un courriel de confirmation vous a été envoyé.")
        page.should have_content("Vous devez confirmer votre inscription pour continuer.")
        
        current_path.should == login_path
        
        User.find(:all, :conditions => {
                          :username => @user.username, 
                          :email => @user.email, 
                          :active => false}).count.should == 1
        
        mailbox_for(@user.email).size.should == 1
        email = open_email(@user.email)
        url = "http://localhost:3000/user_activates"
        email.default_part_body.to_s.should include(url)
      end
    end

    context "when supplied data is invalid" do
      it "should not sign up" do
        click_button "Valider"
        wait_for_ajax
        
        
        current_path.should == login_path
        page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
      end
    end   
  end
  
  describe "update a user" do
    
    before(:each) do
      @user = Factory.create(:user, :active => true)
      login_user(@user)
      visit configuration_path      
      @new_username = "Guirecc2"
      @new_email = "test@test1.com"
    end
    
    context "when supplied data is valid" do
    
      after(:each) do     
        page.should have_content("Votre compte a été modifié")
        
        new_user = User.find @user.id
        new_user.username.should == @new_username
        new_user.email.should == @new_email
        current_path.should == configuration_path
      end
      
      it "update the user" do
        fill_update_form_with( :username => @new_username, 
                        :email => @new_email, 
                        :password => 'password')
      end
      
      it "update the user without password" do
        fill_update_form_with(:username => @new_username, :email => @new_email)
      end
    end
    
    context "when supplied with invalid data" do
      it "show errors" do
        fill_update_form_with(:username => '', :email => '')
        
        current_path.should == configuration_path
        page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
      end
    end

    def fill_update_form_with(options = {})
      within(".edit_user") do
        fill_in "Pseudo", :with => options[:username]
        fill_in "Email", :with => options[:email]
        fill_in "Mot de passe", :with => options[:password]
      end
      click_button "Valider"
      wait_for_ajax
    end
  end
  
  describe "delete a user" do
    it "delete a user" do
      username = "Guirecc"
      password = "password"
      user = Factory.create(
              :user, 
              :username => username, 
              :password => password, 
              :active => true)
              
      login_user_with_interface(username, password)
      visit configuration_path
      click_link "Supprimer mon compte"
      
      current_path.should == login_path
      page.should have_content("Votre compte à été supprimé")
      User.count.should == 0
      UserSession.find.should == nil
    end
  end

  describe "connect a user" do
    context "when supplied data is valid" do
      it "connect the user" do
        password = "password"
        
        user = Factory.create(:user, :password => password, :active => true)
        login_user_with_interface(user.username, password)
        
        current_path.should == root_path
      end
    end
    
    context "when supplied data is invalid" do
      it "show an error message" do
        visit login_path
        click_link "Connexion | Inscription"
        within("#new_user_session") do
          click_button "Connexion"
        end
        wait_for_ajax 
        
        page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
      end
    end
  end
  
  describe "disconnect a user" do
    context "when the user follow the link for disconnection" do
      it "disconnect the user" do
        password = 'password'
        user = Factory.create(:user, :password => password, :active => true)
        login_user_with_interface user.username, password
        
        visit root_path
        click_link "delete"
        
        UserSession.find.should == nil
      end
    end
  end
end
