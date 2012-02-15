@javascript
Feature:
  In order to destroy my bank accounts
  As a logged user
  
  Background:
    Given I am logged in as "Guirecc"
    And a bank exists
    And account type exists
    And a account exists for "Guirecc"
      
    When I go to the configuration page
  
  Scenario: destroy a bank account
    When I follow "Comptes Bancaires" 
    And I follow "destroy_account"
    And I confirm popup
    
    Then account should not exist
    And I should be on the configuration page
    And I should see "Votre compte a été supprimé."
