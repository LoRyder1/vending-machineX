Feature: Sold Out
As a customer
I want to be told when the item I have selected is not available
So that I can select another item

  Scenario: Be able to show item is sold out
  Given I vend and insert a quarter into vending machine
  When I insert a quarter into vending machine
  When I insert a quarter into vending machine
  When I select a candy product
  Then the dispenser should be empty
  And the display reads SOLD OUT
