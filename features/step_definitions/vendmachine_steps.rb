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
CHIPS = Product.new(50,'chips',true)
CANDY = Product.new(65,'candy',false)

When(/^I select a (\S[a-z]*) product$/) do |product|
  @vend.select_product(product)
end

Then(/^the (\S[a-z]*) product is dispensed/) do |product|
  expect(@vend.dispenser[0]).to eq product
end

Then(/^the current amount is (\d+)$/) do |amount|
  expect(@vend.current_amount).to eq amount
end

Then(/^the display reads (\w+\s+\w+\Z)$/) do |msg|
  expect(@vend.display).to eq msg
end

Then(/^the remaining money is in coin return/) do
  expect(@vend.coin_return[0]).to eq QUARTER
end

Then(/^the dispenser should be empty/) do
  expect(@vend.dispenser[0]).to eq nil
end

Given(/^the vending machine needs exact change/) do
  @vend = VendingMachine.new
  @vend.no_change_left
end
