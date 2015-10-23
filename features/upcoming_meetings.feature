Feature: Upcoming meetings page

  As a Rubyist
  In order to find a user group I can go to to learn more about testing
  I visit the upcoming meetings page

  Scenario: No upcoming meetings
    Given there are no upcoming meetings
    And there is 1 past meeting
    When I visit the "Upcoming Meetings" page
    Then I should see the text "No meetings have been scheduled yet"
    And I should see a link to Dana's Twitter page