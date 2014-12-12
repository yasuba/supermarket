Feature: Shopping
  In order to do my shopping
  As a hungry consumer
  I want to pick up a new basket

Scenario: Choosing items
  Given I am on the homepage
  When I click "Add apple"
  Then I should see "1 item added"
