Feature: Users
  In order delete all my information
  As a logged user
  I want to delete my account
  
  
  Scenario: delete a user
  
    Given I am logged in as "Guirecc"
    
    When I go to the configuration page
	  And I follow "Supprimer mon compte"
	
	  Then I should be on the login page
	  And I should see "Votre compte à été supprimé"
	  And user should not exist
	  And I should be disconnected
