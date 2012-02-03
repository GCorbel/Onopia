@javascript
Feature: Organize records
  As a logged User
  I want categorize my account
  Then I do the modifications
 
  Scenario: Modify a category of an account
    Given a user exists with username: "Guirecc", active: true, password: "generic", email: "guirecc@example.com"
    And a account exists with user: the user
    And a category exists with label: "Épicerie"
    And a category exists with label: "Salaire"
    And a record exists with account: the account, category: the category
    And I am logged in as "Guirecc"
    And I go to the management index page
    And show me the html
    And I wait until all Ajax requests are complete
     
    When I select "Épicerie" from "category_id" for the first record of "Guirecc"
    And I wait until all Ajax requests are complete
    
    Then the category for first record for "Guirecc" should be "Épicerie"
