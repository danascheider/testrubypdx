Feature: Speaker talk routes
  
  Background:
    Given there are 2 speakers
    And the first speaker has 2 talks
    And the last speaker has 2 talks

  Scenario: Visit route for a given speaker's talks
    When I visit the page for that speaker's talks
    Then I should see all that speaker's talks
    And I should not see the other talks

  Scenario: 