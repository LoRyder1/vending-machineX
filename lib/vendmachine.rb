class Coin
  attr_reader :weight, :size, :value
  def initialize weight, size
    @weight, @size = weight, size
    @value = nil
  end

  def set_value
    if weight == 3 && size == 3
      @value = 5
    elsif weight == 4 && size == 4
      @value = 25
    elsif weight == 2 && size == 2
      @value = 10
    end
  end
end

class VendingMachine
  def insert_coin coin
        
  end
end