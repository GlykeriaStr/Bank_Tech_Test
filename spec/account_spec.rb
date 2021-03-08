require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0)
  end

  it 'lets you make a deposit' do
    account.deposit(10)
    expect(account.balance).to eq(10.00)
  end

  describe '#withdraw' do
    it 'lets you withdraw' do
      account.deposit(10)
      expect{ account.withdraw(5) }.to change{ account.balance }.by(-5)
    end

    it 'throws an error when there are insufficient funds in the account' do
      expect{ account.withdraw(5) }.to raise_error('There are insufficient funds in your account.')
    end
  end
end
