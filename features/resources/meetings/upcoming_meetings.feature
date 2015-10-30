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

  Scenario: There is an upcoming meeting
    Given there is 1 upcoming meeting
    And there are 2 past meetings
    When I visit the "Upcoming Meetings" page
    Then I should see 1 meeting listed

  Scenario: User is not logged in
    Given I am not logged in
    And there is 1 upcoming meeting
    When I visit the "Upcoming Meetings" page
    Then I should not see the text "Edit"

  Scenario: User is logged in
    Given I am logged in
    And there is 1 upcoming meeting
    When I visit the "Upcoming Meetings" page
    Then I should see the text "Edit"