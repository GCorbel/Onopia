@javascript
Feature: Search records
  As a logged User
  I want to check my account
  Then I search in my bank account
 
  Background:
    Given I am logged in as "Guirecc"
    And "Guirecc" have an account
    And I load the file for "Guirecc" with bank "Credit Agricole" and type "CODEVI"
    And I go to the management index page
    And I wait until all Ajax requests are complete
     
  Scenario Outline: Search some records
    When I fill in "Rechercher" with "<search>"
    And I wait until all Ajax requests are complete
    Then I should see "sur <result_number> éléments"
   
    Scenarios:
      | result_number | search                                    |
      | 50            |                                           |
      | 3             | TRESOR PUBLIC 75 IMPOT NUM 005002 ECH 17  |
      | 3             | 80                                        |
      | 7             | 23                                        |
