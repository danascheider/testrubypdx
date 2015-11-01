Feature: View Speaker

  As a visitor to the website
  In order to find out more about the background of a given speaker
  I need to view the speaker's page

  Background:
    Given there is 1 speaker
    And the speaker has 1 talk

  Scenario: Visitor views speaker's page
    Given I am on the page of the speaker
    Then I should see the speaker's name
    And I should see the speaker's website
    And I should see the speaker's company
    And I should see the speaker's bio
    And I should see the title of the speaker's talk
    And I should not see the 'Edit' link
    And I should not see the 'Destroy' link

  Scenario: Logged-in user views speaker's page
    Given I am logged in
    And I am on the page of the speaker
    Then I should see the speaker profile
    And I should see the title of the speaker's talk
    And I should see the 'Edit' link
    And I should see the 'Destroy' link