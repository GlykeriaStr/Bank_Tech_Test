# frozen_string_literal: true

require 'time'
class Transaction
  attr_reader :date, :type, :value, :balance

  def initialize(type:, value:, balance:, date: Date.today.strftime('%d/%m/%y'))
    @date = date
    @type = type
    @value = value
    @balance = balance
  end
end
