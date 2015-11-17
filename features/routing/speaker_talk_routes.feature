Feature: Speaker talk routes
  
  Background:
    Given there are 2 speakers
    And the first speaker has 2 talks
    And the last speaker has 2 talks
    And I am logged in

  Scenario: Visit route for a given speaker's talks
    When I visit the page for the first speaker's talks
    Then I should see all that speaker's talks
    And I should not see the other talks

  Scenario: Create a talk for a particular speaker
    When I visit the page to create a talk for the first speaker
    And I submit the '#new_talk' form with the following attributes:
      | title            |
      | How to Use RSpec |
    Then the speaker should have a talk called 'How to Use RSpec'
    And I should be on the talk's show page