Feature: User visits homepage

  As a user
  In order to learn more about Ruby testing
  I visit the TestRubyPDX homepage

  Scenario:
    When I visit the web site
    Then I should see the text "Welcome to Test Ruby PDX!"
    And I should see the top navigation bar

  Scenario: User not logged in
    Given I am not logged in
    When I visit the web site
    Then I should not see the text "Logout"
    And I should not see the text "Admin"
    And I should not see the text "Login"

  Scenario: User logged in
    Given I am logged in
    When I visit the web site
    Then I should see the text "Logout"
    And I should see the text "Admin"