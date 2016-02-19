describe 'VendingMachine' do
  let(:coin) {double('coin')}
  let(:product) {double('product')}
  subject {VendingMachine.new}

  def set_coin_value value
    allow(coin).to receive(:value).and_return value
  end

  def set_product_value value
    allow(product).to receive(:value).and_return value
  end

  def set_current_amount value
    allow(subject).to receive(:current_amount).and_return value
    # subject.current_amount = value
  end

  describe '#insert_coin' do
    it 'is defined as a method' do
      expect(VendingMachine.method_defined?(:insert_coin)).to eq true
    end

    it 'method takes in one argument' do
      expect(subject.method(:insert_coin).arity).to eq 1
    end

    it 'inserting nickel adds appropriate value to current amount' do
      set_coin_value 5; subject.insert_coin(coin)
      expect(subject.current_amount).to eq 5
    end

    it 'inserting a quarter adds appropriate value to current amount' do
      set_coin_value 25; subject.insert_coin(coin)
      expect(subject.current_amount).to eq 25
    end
  end

  describe '#display' do
    it "when no coin is inserted display reads 'INSERT COIN'" do
      expect(subject.display).to eq 'INSERT COIN'
    end
  end

  describe '#update_display' do
    it "updates display to 'COIN REJECTED' if coin is rejected" do 
      set_coin_value 0; subject.update_display(coin)
      expect(subject.display).to eq 'COIN REJECTED'
    end

    it 'updates display to current amount' do 
      set_coin_value 25; subject.update_display(coin)
      expect(subject.display).to eq '25'
    end
  end

  describe '#reject_coin' do
    it 'rejected coins are put in coin return' do
      subject.reject_coin(coin)
      expect(subject.coin_return[0]).to eq coin
    end
  end

  describe '#select_product' do
    it 'method takes in one argument' do
      expect(subject.method(:select_product).arity).to eq 1
    end

    it 'selecting a product places it in the dispenser' do
      set_product_value 0; subject.select_product(product)
      expect(subject.dispenser[0]).to eq product
    end

    it 'does not dispense if current amount < product value' do
      set_product_value 50; subject.select_product(product)
      expect(subject.dispenser[0]).to eq nil
    end

    it 'if current amount < product value display shows product value' do
      set_product_value 50; subject.select_product(product)
      expect(subject.display).to eq "50"
    end
  end

  describe '#buy_product' do
    let(:current_amount) {50}
    subject {VendingMachine.new(current_amount)}

    it 'subtracts value of product from current amount' do
      set_product_value 50; subject.buy_product(product)
      expect(subject.current_amount).to eq 0
    end
  end
end

describe 'Product' do
  let(:num) {double('num')}
  let(:name) {double('name')}
  subject {Product.new(num, name)}

  it 'new instance takes in two arguments' do
    expect(subject.method(:initialize).arity).to eq 2
  end
end

describe 'Coin' do
  let(:num) {double('num')}
  subject {Coin.new(num, num)}

  def set_coin weight, size
    allow(subject).to receive_messages(weight: weight, size: size)
  end

  it 'new instance takes in two arguments' do
    expect(subject.method(:initialize).arity).to eq 2
  end

  describe '#set_value' do
    it 'returns value of nickel' do
      set_coin 3,3; subject.set_value
      expect(subject.value).to eq 5
    end

    it 'returns value of quarter' do
      set_coin 4,4; subject.set_value
      expect(subject.value).to eq 25
    end

    it 'returns value for dime' do
      set_coin 2,2; subject.set_value
      expect(subject.value).to eq 10
    end

    it 'returns value for penny' do
      set_coin 1,1; subject.set_value
      expect(subject.value).to eq 0
    end
  end
end
