Feature: Select Products
As a vendor
I want customers to select products
So that i can give them an incentive to put money in the machine

  Scenario: Be able to select one of three products
  Given I vend and insert a quarter into vending machine
  When I insert a quarter into vending machine
  When I select a chips product
  Then the chips product is dispensed
  And the display reads THANK YOU