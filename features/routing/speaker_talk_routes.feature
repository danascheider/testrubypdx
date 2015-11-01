Feature: Speaker talk routes
  
  Background:
    Given there is 1 speaker
    And the speaker has 2 talks
    And there are 2 additional talks

  Scenario: Visit route for a given speaker's talks
    When I visit the page for that speaker's talks
    Then I should see all that speaker's talks
    And I should not see the other talks