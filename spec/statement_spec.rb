# frozen_string_literal: true

require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:deposit) { double(date: '17/03/2000', type: :credit, value: 10, balance: 10.00) }
  let(:withdraw) { double(date: '08/03/2021', type: :debit, value: 5, balance: 5.00) }
  let(:transactions) { double(list: [deposit, withdraw]) }

  it 'prints the whole statement' do
    expect do
      statement.print(transactions.list)
    end.to output("date || credit || debit || balance\n08/03/2021 || || 5.00 || 5.00\n17/03/2000 || 10.00 || || 10.00\n").to_stdout
  end
end
