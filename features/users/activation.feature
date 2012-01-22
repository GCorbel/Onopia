Feature: Users
  In order access to my account
  As a visitor
  I want to validate my self
  
  Scenario: activate a valid member
  
    Given a user exists with username: "Guirecc", active: false

    When I go to the user activates page for Guirecc
	
	  Then I should be on the login page
	  And a user should exist with username: "Guirecc", active: true
	  And I should see "Votre compte a été activé. Vous pouvez vous connecter."
