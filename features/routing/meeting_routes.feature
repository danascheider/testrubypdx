Feature: Meeting routes
  
  Scenario: User visits past meeting index
    Given there are 2 past meetings
    And there are 2 upcoming meetings
    When I visit '/meetings/past'
    Then I should see all the past meetings listed
    And I should not see the upcoming meetings

  Scenario: User visits upcoming meeting index
    Given there are 2 past meetings
    Given there are 2 upcoming meetings
    When I visit '/meetings/upcoming'
    Then I should see all the upcoming meetings listed
    And I should not see the past meetings

  Scenario: User visits individual meeting page
    Given there are 4 meetings
    And the meetings have talks
    When I visit the first meeting's page
    Then I should see the first meeting's information
    And I should not see the last meeting's information