Feature: Create user
  Scenario: Valid user creation when there are no users
    Given there are no users
    When I visit the "Create a User" page
    And I submit the creation form with valid information
    Then there should be 1 user
    And I should be logged in

  Scenario: Valid user creation when there are other users
    Given I am logged in
    When I visit the "Create a User" page
    And I submit the creation form with valid information
    Then there should be 2 users

  Scenario: Invalid user creation
    Given there are no users
    When I visit the "Create a User" page
    And I submit the user creation form with no username
    Then there should be no users
    And I should see a message that username cannot be blank

  Scenario: Unauthorized user creation
    Given there are 3 users
    And I am not logged in
    When I visit the "Create a User" page
    Then I should not see the user creation form
    And I should be on the '/login' page