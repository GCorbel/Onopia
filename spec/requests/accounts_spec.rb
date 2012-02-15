# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'

describe "manage accounts", :js => true do
  self.use_transactional_fixtures = false
  
  before(:each) do
    user = Factory.create(:user, :active => true)
    bank = Factory.create(:bank, :label => "Credit Agricole")
    @account_type = Factory.create(:account_type, :label => "CODEVI")
    Factory.create(:account, :user_id => user.id)
    login_user(user)
    visit configuration_path
  end
  
  context "add account" do
    
    before(:each) do
      click_link "Comptes Bancaires"
      click_link "Ajouter un compte bancaire"
      
      wait_for("#bank_label")
    end
    
    context "when the user search a bank with the search field" do
      it "show results" do
        search_bank("Credit Agricole")
        page.should have_content("Credit Agricole")
      end
    end
    
    context "when the user search a bank with letters" do
      it "show results" do
        click_link "C"
        wait_for_ajax
        
        page.should have_content("Credit Agricole")
      end
    end
    
    context "when the user fill the form to add an account" do
      before(:each) do
        search_bank("Credit Agricole")
        click_link "Configurer"
        wait_for("#account_type_id_select")
      end
      
      context "when valid data is supplied" do
        it "add an account" do
          login = "0123456789"
          password = "password"
          
          within("#new_account") do
            fill_in("Identifiant", :with => login)
            fill_in("Mot de passe", :with => password)
            click_button("Ajouter le compte")
          end
          
          current_path.should == configuration_path
          page.should have_content("Votre compte a été correctement paramétré.")
          page.should have_content("Ajouter un compte bancaire")
          Account.find( :first, 
                        :conditions => {
                          :type_id => @account_type.id, 
                          :login => login, 
                          :password => password}).should_not be_nil
        end
      end
      
      context "when invalid data is supplied" do
        it "show error" do
          within("#new_account") do
            click_button("Ajouter le compte")
          end
          
          current_path.should == configuration_path
          page.should have_xpath('//*', "erreurs? (ont étés|a été) commises?")
        end
      end
    end
  end
  
  context "when the user destroy account" do
    it "destroy account" do
      click_link "Comptes Bancaires"
      click_link "destroy_account"
      confirm_popup
      wait_for_ajax
      
      Account.count.should == 0
      current_path.should == configuration_path
      page.should have_content("Votre compte a été supprimé.")
    end
  end
  
  def search_bank(bank)
    within("#new_bank") do
      fill_in "bank_label", :with => "Credit"
      click_button "Rechercher"
    end
    wait_for_ajax
  end
  
end
