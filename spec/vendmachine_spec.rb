describe 'VendingMachine' do
  let(:coin) {double('coin')}
  subject {VendingMachine.new}

  describe '#insert_coin' do
    xit 'is defined as a method' do
      expect(VendingMachine.method_defined?(:insert_coin)).to eq true
    end
  end
end

describe 'Coin' do
  let(:num) {double('num')}
  subject {Coin.new(num, num)}

  it 'expects to take in two arguments' do
    expect(subject.method(:initalize).arity).to eq 2
  end
end