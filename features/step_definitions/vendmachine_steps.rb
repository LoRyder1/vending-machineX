QUARTER = Coin.new(4,4)
NICKEL = Coin.new(3,3)
DIME = Coin.new(2,2)
PENNY = Coin.new(1,1)
  
Given(/^I vend and insert a (\S[a-z]*) into vending machine$/) do |coin|
  @vend = VendingMachine.new
  @vend.insert_coin(coin)
end

Then(/^the value of the (\S[a-z]*) will be added to current amount$/) do |coin|
  expect(@vend.current_amount).to eq coin.value
end

When(/^I insert a (\S[a-z]*) into vending machine$/) do |coin|
  @vend.insert_coin(coin)
end

Then(/^the coin will be rejected/) do
  expect(@vend.display).to eq 'COIN REJECTED'
end

#=================================================

