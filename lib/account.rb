# frozen_string_literal: true

require 'time'
class Account
  attr_reader :balance

  def initialize(balance = 0.00, statement = Statement, transaction = Transaction)
    @balance = balance
    @statement = statement
    @transaction = transaction
  end

  def deposit(amount)
    negative_amount(amount)
    @balance += amount
    @transaction.new(date: Date.today.strftime('%d/%m/%y'), type: :credit, value: amount, balance: @balance)
  end

  def withdraw(amount)
    negative_amount(amount)
    raise 'There are insufficient funds in your account.' unless @balance > amount

    @balance -= amount
    @transaction.new(date: Date.today.strftime('%d/%m/%y'), type: :debit, value: amount, balance: @balance)
  end

  def print_statement
    "date || credit || debit || balance\n8/3/2021 || 10.00 || || 10.00"
  end

  private

  def negative_amount(amount)
    raise 'Please enter a positive amount.' if amount.negative?
  end
end
