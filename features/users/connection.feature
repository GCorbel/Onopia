Feature: Users
  In order to have access to private features
  As a registered user
  I want to log me in

  @javascript
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

  @javascript
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
    Given I am logged in as "Guirecc"
	  
	  When I go to the login page
	  
	  Then I should be on the home page
