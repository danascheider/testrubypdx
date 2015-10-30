Feature: View talk

  Background: 
    Given there is 1 talk

  Scenario: User is not logged in

    As a prospective attendee,
    in order to find out if a talk is interesting to me
    I want to view the talk's details.

    Given I am not logged in
    When I visit the page for the talk
    Then I should see the talk's title
    And I should see the talk's description
    And I should see the speaker's name
    And I should not see the 'Edit' link

  Scenario: User is logged in

    As an admin, 
    in order to check the accuracy of the information on the site,
    I need to view the details of a particular talk.

    Given I am logged in
    When I visit the page for the talk
    Then I should see the talk's title
    And I should see the talk's description
    And I should see the speaker's name
    And I should see the 'Edit' link