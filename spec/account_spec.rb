require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:printed_statement) { "date || credit || debit || balance\n8/3/2021 || 10.00 || || 10.00" }

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

  it 'prints a bank statement' do
    account.deposit(10)
    expect(account.print_statement).to eq printed_statement
  end
end
