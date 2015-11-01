Feature: Speaker routes

  Scenario: User views the list of speakers
    Given there are 4 speakers
    When I visit '/speakers'
    Then I should see all the speakers listed

  Scenario: User views an individual speaker
    Given there are 4 speakers
    When I visit the first speaker's page
    Then I should see the first speaker's profile
    And I should not see the last speaker's profile