Feature: Return Change
As a vendor
I want customers to receive correct change
So that they will use the vending machine again

  Scenario: Be able to return change after using vending machine
  Given I vend and insert a quarter into vending machine
  When I insert a quarter into vending machine
  When I insert a quarter into vending machine
  When I select a chips product
  Then the remaining money is in coin return
