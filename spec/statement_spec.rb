# frozen_string_literal: true
require 'time'
require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:date_credit) { Date.new(2000, 3, 17).strftime('%d/%m/%Y') }
  let(:date_debit) { Date.new(2021, 3, 8).strftime('%d/%m/%Y') }
  let(:deposit) { double(date: date_credit, type: :credit, value: 10, balance: 10.00) }
  let(:withdraw) { double(date: date_debit, type: :debit, value: 5, balance: 5.00) }
  let(:transactions) { double(list: [deposit, withdraw]) }

  it 'prints the whole statement' do
    expect do
      allow(Date).to receive(:today) { date_credit }
      allow(Date).to receive(:today) { date_debit }
      statement.print(transactions.list)
    end.to output("date || credit || debit || balance\n08/03/2021 || || 5.00 || 5.00\n17/03/2000 || 10.00 || || 10.00\n").to_stdout
  end
end
