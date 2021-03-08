require 'time'

describe 'Acceptance Criteria' do
  let(:account) { Account.new }
  let(:day1) { Date.new(2012, 1, 10) }
  let(:day2) { Date.new(2012, 1, 13) }
  let(:day3) { Date.new(2012, 1, 14) }

  let(:example_statement) do
    "date || credit || debit || balance\n"\
    "14/01/2012 || || 500.00 || 2500.00\n"\
    "13/01/2012 || 2000.00 || || 3000.00\n"\
    "10/01/2012 || 1000.00 || || 1000.00"
  end

  it 'passes the acceptance criteria' do
    allow(Date).to receive(:today) { day1 }
    account.deposit(1000)
    allow(Date).to receive(:today) { day2 }
    account.deposit(2000)
    allow(Date).to receive(:today) { day3 }
    account.withdraw(500)
    expect{ account.print_statement }.to output(example_statement).to_stdout
  end
end
