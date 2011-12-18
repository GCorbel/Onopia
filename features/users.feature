Feature: Users
  In order to manage my own account
  As a visitor
  I want to have all the possibilities required
  

################################################################
#                          Registration
################################################################
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
  @javascript @connexion
  Scenario: log in with valid information
  
    Given a user exists with username: "Guirecc", password: "test1234", active: true

    When I go to the login page
	  And I fill in the following:
      | user_session[username] | Guirecc                  |
      | user_session[password] | test1234                 |
    And I press "Se connecter"
    And I wait until all Ajax requests are complete
	
	  Then I should be on the home page
	  And I should see "Bienvenue Guirecc"

  @javascript @connexion
  Scenario: log in with invalid information
	  Given I have no user

    When I go to the login page
	  And I fill in the following:
      | user_session[username] | Guirecc                  |
      | user_session[password] | test1234                 |
    And I press "Se connecter"
	      
	  Then I should see "1 erreur à été commise"
	  
	@connexion
	Scenario: try to access in the loggin page when I am logged
	  Given I am a logged user
	  
	  When I go to the login page
	  
	  Then I should be on the home page


################################################################
#                          Disconnection
################################################################	  
	  
	@disconnection
  Scenario: log out a user
  
    Given I am a logged user
	
	  When I go to the home page
	  And I follow "Se deconnecter"
	
	  Then I should be on the login page
	  And I should be disconnected
