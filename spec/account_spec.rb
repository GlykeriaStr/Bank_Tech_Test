# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:printed_statement) { "date || credit || debit || balance\n8/3/2021 || 10.00 || || 10.00" }

  describe '#balance' do
    it 'starts with 0 balance' do
      expect(account.balance).to eq(0)
    end

    it 'can be initialized with any amount' do
      account2 = Account.new(30.5)
      expect(account2.balance).to eq(30.50)
    end
  end

  describe '#deposit' do
    it 'lets you make a deposit' do
      account.deposit(10)
      expect(account.balance).to eq(10.00)
    end

    it 'throws an error if you add negative amount' do
      expect { account.deposit(-10) }.to raise_error('Please enter a positive amount.')
    end
  end

  describe '#withdraw' do
    it 'lets you withdraw' do
      account.deposit(10)
      expect { account.withdraw(5) }.to change { account.balance }.by(-5)
    end

    it 'throws an error when there are insufficient funds in the account' do
      expect { account.withdraw(5) }.to raise_error('There are insufficient funds in your account.')
    end

    it 'throws an error if you withdraw negative amount' do
      expect { account.withdraw(-10) }.to raise_error('Please enter a positive amount.')
    end
  end

  it 'prints a bank statement' do
    account.deposit(10)
    expect(account.print_statement).to eq printed_statement
  end
end
