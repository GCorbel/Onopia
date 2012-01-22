Feature: Users
  In order to have an account
  As a visitor
  I want to register my self
  
  @javascript @registration
  Scenario: Create a user with valid information
    Given I am on the login page
    And I have no user
    
    When I fill in the following:
      | user[username] | Guirecc                  |
      | user[email]    | test@test.com            |
      | user[password] | test1234                 |
    And I press "Valider"
    And I wait until all Ajax requests are complete
    
    Then I should see "Vous avez été enregistré."
    And I should see "Un courriel de confirmation vous a été envoyé."
    And I should see "Vous devez confirmer votre inscription pour continuer."
    And I should be on the login page
    And the following users should exist:
      | username  | email         | active   |
      | Guirecc   | test@test.com | false    |
      
  @email @registration
  Scenario: Create a user with valid information and receive an email
    Given I am on the login page
    And I have no user
    
    When I fill in the following:
      | user[username] | Guirecc                  |
      | user[email]    | test@test.com            |
      | user[password] | test1234                 |
    And I press "Valider"
    
    Then "test@test.com" should receive an email
    
    When "test@test.com" open the email with subject "Activation de votre compte"
    And I should see "http://localhost:3000/user_activates" in the email body
      
  
  @javascript @registration   
  Scenario: Create a user with invalid information
    Given I am on the login page
    
    When I press "Valider" 
    
    Then I should be on the login page
    And I should see "erreurs ont étés commises"
    And I should see "Email : ne semble pas être une adresse email"
    And I should see "Pseudo : est trop court"
    And I should see "Mot de passe : est trop court"
