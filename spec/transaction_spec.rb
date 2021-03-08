require 'transaction'

describe Transaction do
  let(:date) { Date.new(1990, 3, 17)}
  subject(:transaction) { described_class.new(date: date, type: :credit, value: 10, balance: 10.00) }

  it 'creates an instance of Transaction' do
    allow(Date).to receive(:today).and_return(date)
    expect(transaction.date).to eq(date)
    expect(transaction.type).to eq(:credit)
    expect(transaction.value).to eq(10)
    expect(transaction.balance).to eq(10.00)
  end
end
