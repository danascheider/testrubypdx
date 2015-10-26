Feature: Create user
  Scenario: Valid user creation
    Given there are no users
    When I visit the "Create a User" page
    And I submit the creation form with valid information
    Then there should be 1 user
    And I should be logged in