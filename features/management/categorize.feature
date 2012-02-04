@javascript
Feature: Organize records
  As a logged User
  I want categorize my account
  Then I do the modifications
 
  Scenario: Modify a category of an account
    Given I have a clean database
    Given a user: "guirecc" exists with username: "Guirecc", active: true, password: "generic", email: "guirecc@example.com"
    And a account exists with user: the user
    And a category: "Épicerie" exists with label: "Épicerie", id: 1
    And a category: "Salaire" exists with label: "Salaire", id: 2
    And a record: "record1" exists with account: the account, category: the category
    And I am logged in as "Guirecc"
    And I go to the management index page
    And I wait until all Ajax requests are complete
     
    When I select "Épicerie" from "category_id" for the first record of "Guirecc"
    And I wait until all Ajax requests are complete
    
    Then a record: "record1" should exist with category_id: 1
