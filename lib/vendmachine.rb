class Coin
  attr_reader :weight, :size, :value
  def initialize weight, size
    @weight, @size = weight, size
    @value = nil
  end

  def set_value
    if weight == 2 && size == 2
      @value = 5
    end
  end
end

class VendingMachine
  def insert_coin
    
  end
end