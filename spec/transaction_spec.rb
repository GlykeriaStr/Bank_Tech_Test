require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(date: Date.today.strftime("%d/%m/%y"), type: credit, balance: balance) }
  let(:account) { double :account, deposit: 10, withdraw: 5}
  let(:credit) { 10 }
  let(:balance) { 10.00 }

  it 'creates a transaction when the user does a deposit' do
    expect(transaction.date).to eq(Date.today.strftime("%d/%m/%y"))
  end
end
