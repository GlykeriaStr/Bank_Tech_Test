class Account

attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'There are insufficient funds in your account.' unless @balance > amount
    @balance -= amount
  end
end
