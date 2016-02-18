class Product
  def initialize price, name
    @price, @name = price, name
  end
end

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
  attr_reader :current_amount, :display, :coin_return, :dispenser
  def initialize
    @current_amount = 0
    @display = 'INSERT COIN'
    @coin_return = []
    @dispenser = []
  end

  def insert_coin coin
    @current_amount += coin.value
    update_display(coin)
  end

  def update_display coin
    if coin.value == 0
      @display = 'COIN REJECTED'
    else
      @display = "#{coin.value}"
    end
  end

  def reject_coin coin
    @coin_return.push(coin)
  end

  def select_product product
    @dispenser.push(product)
  end
end
