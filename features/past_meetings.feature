Feature: Past meetings page

  Scenario: Visit past meetings page
    Given there are no past meetings
    And there is 1 upcoming meeting
    When I visit the 'Past Meetings' page
    Then I should see the text "We haven't had any meetings yet!"
    And I should see a link to the 'Upcoming Meetings' page