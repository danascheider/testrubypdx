Feature: Login

  Scenario: Successful login
    Given I am a registered user
    And I am on the login page
    When I fill in 'username' with my username
    And I fill in 'password' with my password
    And I submit the login form
    Then I should be on the homepage
    And I should see the "Logout" link
    And I should see the "Add Meeting" link