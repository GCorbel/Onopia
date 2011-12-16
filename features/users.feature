Feature: Users
  In order to manage my own account
  As a visitor
  I want to have all the possibilities required
  

################################################################
#                          Registration
################################################################

  Scenario: Create a user with valid information
    Given I am on the login page
    And I have no user
    
    When I fill in the following:
      | Pseudo       | Guirecc                  |
      | Email        | test@test.com            |
      | Mot de passe | test1234                 |
    And I press "Valider"
    
    Then I should see "Vous avez été enregistré. Un courriel de confirmation vous a été envoyé. Vous devez confirmer votre inscription pour continuer"
    And I should be on the login page
    And "test@test.com" should receive an email
    
    When "test@test.com" open the email with subject "Activation de votre compte"
    And I should see "http://localhost:3000/user_activates" in the email body
    And the following users should exist:
      | username  | email         | active   |
      | Guirecc   | test@test.com | false    |
      
      
  Scenario: Create a user with invalid information
    Given I am on the login page
    
    When I press "Valider" 
    
    Then I should see an error message
    And I should see "erreurs ont étés commises"
    And I should see "Email : ne semble pas être une adresse email"
    And I should see "Pseudo : est trop court"
    And I should see "Mot de passe : est trop court"



################################################################
#                          Activation
################################################################
  Scenario: activate a valid member
  
    Given a user exists with username: "Guirecc", active: false

    When I go to the user activates page for Guirecc
	
	  Then I should be on the login page
	  And a user should exist with username: "Guirecc", active: true
	  And I should see "Votre compte a été activé. Vous pouvez vous connecter."



################################################################
#                          Connection
################################################################
