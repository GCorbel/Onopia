@javascript
Feature: Users
  In order to change my information
  As a logged user
  
  Background:
    Given I am logged in as "Guirecc"
    
    When I go to the configuration page
  
  
  Scenario: update a user
	  When I fill in the following:
      | user[username] | Guirecc2                 |
      | user[email]    | test@test.com            |
      | user[password] | test1234                 |
    And I press "Valider"
    And I wait until all Ajax requests are complete
	
	  Then I should be on the configuration page
	  And I should see "Votre compte a été modifié"
    And the following users should exist:
      | username  | email         | active |
      | Guirecc2  | test@test.com | true   |	
  
  Scenario: update a user without the password
	  Then I fill in the following:
      | user[username] | Guirecc2                 |
      | user[email]    | test@test.com            |
    And I press "Valider"
    And I wait until all Ajax requests are complete
	
	  Then I should be on the configuration page	
  
  Scenario: update a user with error
	  Then I fill in the following:
      | user[username] | Guirecc2        |
      | user[email]    | test            |
    And I press "Valider"
    And I wait until all Ajax requests are complete
	
	  Then I should be on the configuration page
	  And I should see "erreurs ont étés commises"
