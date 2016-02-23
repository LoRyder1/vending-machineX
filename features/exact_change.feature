Feature: Exact Change
As a customer
I want to be told when exact change is required
So that I can determine if I can buy something with the money I have before inserting it

  Scenario: Be able to display message when exact change is needed
  Given the vending machine needs exact change
  Then the display reads EXACT CHANGE