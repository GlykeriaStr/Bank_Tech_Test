# frozen_string_literal: true

require 'time'

class Account

  attr_reader :balance, :transactions

  def initialize(balance = 0.00, statement = Statement, transaction = Transaction)
    @balance = balance
    @statement = statement
    @transaction = transaction
    @transactions = []
  end

  def deposit(amount)
    negative_amount(amount)
    @balance += amount
    @transactions << create_transaction(:credit, amount)
  end

  def withdraw(amount)
    negative_amount(amount)
    raise 'There are insufficient funds in your account.' unless @balance > amount

    @balance -= amount
    @transactions << create_transaction(:debit, amount)
  end

  def print_statement
    account_statement = @statement.new
    account_statement.print(@transactions)
  end

  private

  def negative_amount(amount)
    raise 'Please enter a positive amount.' if amount.negative?
  end

  def create_transaction(type, amount)
    @transaction.new(date: date, type: type, value: amount, balance: @balance)
  end

  def date
    Date.today.strftime('%d/%m/%y')
  end
end
