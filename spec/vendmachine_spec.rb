describe 'VendingMachine' do
  let(:coin) {double('coin')}
  subject {VendingMachine.new}

  describe '#insert_coin' do
    it 'is defined as a method' do
      expect(VendingMachine.method_defined?(:insert_coin)).to eq true
    end
  end
end

describe 'Coin' do
end