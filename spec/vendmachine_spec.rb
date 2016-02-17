describe 'VendingMachine' do
  let(:coin) {double('coin')}
  subject {VendingMachine.new}

  describe '#insert_coin' do
    it 'is defined as a method' do
      expect(VendingMachine.method_defined?(:insert_coin)).to eq true
    end

    it 'method takes in one argument' do
      expect(subject.method(:insert_coin).arity).to eq 1
    end
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
      set_coin 3,3 ; subject.set_value
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
  end
end