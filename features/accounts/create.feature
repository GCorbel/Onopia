@javascript
Feature:
  In order to view my bank accounts
  I want to link a new account with the site
  
  Background:
    Given I am logged in as "Guirecc"
    And a bank exists
    And account type exist with label: "CODEVI"
      
    When I go to the configuration page
    And I follow "Ajouter un compte bancaire"
  
  Scenario: show the screen to add a new account
    Then I should be on the configuration page
    And I should see "Ajouter un compte bancaire"
    
  Scenario: search a new account
    When I fill in "bank_label" with "Credit"
    And I press "Rechercher"
    
    Then I should see "Credit Agricole"
    
  Scenario: search a new account with letters
    When I follow "C"
    
    Then I should see "Credit Agricole"
  
  Scenario:  add a new account
    When I fill in "bank_label" with "Credit"
    And I press "Rechercher"
    And I follow "Configurer"
    When I select "CODEVI" from "Type"
    And I fill in "account[login]" with "0123456890"
    And I fill in "account[password]" with "test1234"
    And I press "Ajouter le compte"
    
    Then I should be on the configuration page
    And  the following accounts should exist:
      | account_type_id   | login         | password   |
      | 1                 | 0123456789    | test234    |
    And I should see "Votre compte a été correctement paramétré."
    And I should see "Ajouter un compte bancaire"
    
  Scenario: Try to add an account with invalid data 
    When I fill in "bank_label" with "Credit"
    And I press "Rechercher"
    And I follow "Configurer"
    And I press "Ajouter le compte"
    
    Then I should see "erreurs ont étés commises"
    And I should be on the configuration page
