class Coin
  attr_reader :weight, :size, :value
  def initialize weight, size
    @weight, @size = weight, size
    @value = nil
    set_value
  end

  def set_value
    if weight == 3 && size == 3
      @value = 5
    elsif weight == 4 && size == 4
      @value = 25
    elsif weight == 2 && size == 2
      @value = 10
    else
      @value = 0
    end
  end
end

class VendingMachine
  attr_reader :current_amount, :display
  def initialize
    @current_amount = 0
    @display = 'INSERT COIN'
  end

  def insert_coin coin
    @display = 'COIN REJECTED' if coin.value == 0
    @current_amount += coin.value
  end
end

# PENNY = Coin.new(1,1)

# @vend = VendingMachine.new
# @vend.insert_coin(PENNY)

# p @vend.current_amount