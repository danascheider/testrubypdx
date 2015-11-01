Feature: Talk routes
  
  Scenario: User views the list of all talks
    Given there are 4 talks
    When I visit '/talks'
    Then I should see all the talks listed

  Scenario: User views one particular talk
    Given there are 4 talks
    When I visit the first talk's page
    Then I should see the first talk's information
    And I should not see the last talk's information