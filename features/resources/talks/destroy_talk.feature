Feature: Destroy talk

  As an admin
  In order to correct errors on the site
  I need to destroy a talk

  Background:
    Given there is 1 talk

  Scenario: Logged-in user destroys talk
    Given I am logged in
    When I visit the page for the talk
    And I click the 'Destroy' link
    Then there should be 0 talks
    And I should be on the talk index page