Transform(/^(-?\S[a-z]*)/) do |coin|
  Object.const_get(coin.upcase)
end