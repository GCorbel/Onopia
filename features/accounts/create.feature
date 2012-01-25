@javascript
Feature:
  In order to view my bank accounts
  I want to link a new account with the site
  
  Background:
    Given I am logged in as "Guirecc"
    And a bank exists
    And account type exist with label: "ADEVI"
      
    When I go to the configuration page
    And I follow "Ajouter un compte bancaire"
  
  Scenario: show the screen to add a new account
    Then I should be on the configuration page
    And I should see "Ajout d'un compte bancaire"
    And I should see "Configuration de mon compte"
    
    
  @now
  Scenario: search a new account
    When I fill in "Credit" with "Rechercher un établissement bancaire"
    And I press "Rechercher"
    
    Then I should see "Credit Agricole"
    
  Scenario: search a new account with letters
    When I follow "C"
    
    Then I should see "Credit Agricole"
    
    
  Scenario: 
    When I fill in "Credit" with "Rechercher un établissement bancaire"
    And I press "Rechercher"
    And I press "Configurer"
    And I fill in "Type" with "CODEVI"
    And I fill in "Identifiant" with "0123456890"
    And I fill in "Mot de passe" with "test1234"
    And I press "Valider"
    
    Then I should see "Votre compte a été correctement paramétré."
    And I should see "Configurer d'autres comptes bancaires"
    And I should should have an account
    And the following account should exist:
      | type  | login         | password   |
      | 1     | 0123456789    | test234    |
    
