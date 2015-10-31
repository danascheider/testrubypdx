Feature: View all speakers
  
  As a visitor to the web site
  In order to find out about the person who gave a particular talk
  I need to view the list of speakers

  Background:
    Given there are 4 speakers

  Scenario: Visitor views the list of speakers
    Given I am not logged in
    When I visit the page with all the speakers
    Then I should see 4 speakers
    But I should not see the 'Edit' link
    And I should not see the 'Destroy' link

  Scenario: Logged-in user views the list of speakers
    Given I am logged in
    When I visit the page with all the speakers
    Then I should see 4 speakers
    And I should see 4 'Edit' links
    And I should see 4 'Destroy' links