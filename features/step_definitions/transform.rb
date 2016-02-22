Transform(/^(?!THANK YOU|SOLD OUT)(-?\S[a-z]*)/) do |coin|
  Object.const_get(coin.upcase)
end

Transform(/^(-?\d+)$/) do |number|
  number.to_i
end