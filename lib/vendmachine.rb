class Product
  attr_reader :value, :name
  def initialize value, name
    @value, @name = value, name
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

QUARTER = Coin.new(4,4)
NICKEL = Coin.new(3,3)
DIME = Coin.new(2,2)
PENNY = Coin.new(1,1)

class VendingMachine
  attr_reader :current_amount, :display, :coin_return, :dispenser
  def initialize current_amount=0
    @current_amount = current_amount
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
    if @current_amount < product.value
      @display = "#{product.value}"
    else
      buy_product(product)
      @dispenser.push(product)
      @display = 'THANK YOU'
    end
  end

  def buy_product product
    @current_amount -= product.value
    set_coin_return(@current_amount)
  end

  def set_coin_return amount
    coin_hash = {QUARTER: 25, DIME: 10, NICKEL: 5}
    symbol = coin_hash.key(amount)
    coin = Object.const_get(symbol)
    @coin_return.push(coin)
    @current_amount = 0
  end
end
