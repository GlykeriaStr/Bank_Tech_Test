require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(date: Date.today.strftime("%d/%m/%y"), type: :credit, value: 10, balance: 10.00) }

  it 'creates an instance of Transaction' do
    expect(transaction.date).to eq(Date.today.strftime("%d/%m/%y"))
    expect(transaction.type).to eq(:credit)
    expect(transaction.value).to eq(10)
    expect(transaction.balance).to eq(10.00)
  end
end
