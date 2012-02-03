@javascript
Feature: User
  In order to verify the processus for reseting a password
  As a visitor
  I want to reset my password

  Scenario: I follow the link and I should view the form
    Given I view the new user reset password form
    Then I should see "Rappel du mot de passe"
        
  Scenario: I fill the form with valid information
    Given I view the new user reset password form
	  When I fill in "user_reset_password_email" with "guirec.corbel@gmail.com"
	  And I press "user_reset_password_submit"
	  Then I should see "Un email vous a été envoyé"
	  And I should see "Veuillez suivre les instructions indiqués afin de modifier votre mot de passe"
	  
    When "guirec.corbel@gmail.com" open the email with subject "Réinitialisation de votre mot de passe"
    Then I should see "http://localhost:3000/user_reset_passwords/" in the email body
      
  Scenario: I fill the form with invalid information
    Given I view the new user reset password form
	  When I press "user_reset_password_submit"
	  Then I should see an error message  
      
  Scenario: I fill the form with invalid email
    Given I view the new user reset password form
	  When I fill in "user_reset_password_email" with "test@test.com"
	  And I press "user_reset_password_submit"
	  Then I should see an error message
	  And I should receive no emails
	  
  Scenario: I change my password with valid information
    Given a user exists with username: "Guirecc", email: "guirec.corbel@gmail.com"
    And I am on the edit user reset password page for Guirecc  
	  When I fill in "user_reset_password[password]" with "test1234"
	  And I press "user_reset_password_submit"
	  Then I should see "Votre mot de passe a été modifié"
	  And I should see "Vous pouvez, maintenant, vous connecter"
	  
	Scenario: I try to change my password with invalid information
	  Given a user exists with username: "Guirecc", email: "guirec.corbel@gmail.com"
    And I am on the edit user reset password page for Guirecc  
	  When I press "user_reset_password_submit"
	  Then I should see an error message
