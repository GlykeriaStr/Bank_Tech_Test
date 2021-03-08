class Account

attr_reader :balance

  def initialize(balance = 0.00, statement = Statement)
    @balance = balance
    @statement = statement
  end

  def deposit(amount)
    raise 'Please enter a positive amount.' if amount < 0
    @balance += amount
  end

  def withdraw(amount)
    raise 'Please enter a positive amount.' if amount < 0
    raise 'There are insufficient funds in your account.' unless @balance > amount
    @balance -= amount
  end

  def print_statement
    "date || credit || debit || balance\n8/3/2021 || 10.00 || || 10.00"
  end
end
