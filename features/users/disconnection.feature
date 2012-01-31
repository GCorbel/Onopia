Feature: Users
  In order quit the site
  As a logged user
  I want log out
	  
	@javascript
  Scenario: log out a user
    Given I am logged in as "Guirecc"
	
	  When I go to the home page 
	  And I follow "Se deconnecter"
	
	  Then I should be disconnected
