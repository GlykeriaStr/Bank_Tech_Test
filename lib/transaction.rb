# frozen_string_literal: true

require 'time'
class Transaction
  attr_reader :date, :type, :value, :balance

  def initialize(date:, type:, value:, balance:)
    @date = date
    @type = type
    @value = value
    @balance = balance
  end
end
