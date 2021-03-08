require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0)
  end
end
