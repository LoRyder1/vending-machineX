Feature: Accept Coins
As a vendor
I want a vending machine that accepts coins
So that I can collect money from the customer

  Scenario: Accept valid coins (nickels, dimes, and quarters)
  Given I vend and insert a nickel into vending machine
  Then the value of the nickel will be added to current amount
  When I insert a penny into vending machine
  Then the coin will be rejected
