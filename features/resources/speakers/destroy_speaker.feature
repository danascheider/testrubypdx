Feature: Destroy speaker profile

  As an admin
  In order to remove a speaker who has asked to have their profile
  taken down from the site
  I need to destroy a speaker profile

  Background:
    Given there is 1 speaker

  Scenario: Logged-in user destroys speaker
    Given I am logged in
    And I am on the speaker's view page
    When I click the 'Destroy' link
    Then there should be no speakers

  Scenario: Visitor can't destroy speaker
    Given I am not logged in
    And I am on the speaker's view page
    Then I should not see the 'Destroy' link