require 'time'
class Transaction

  attr_reader :date, :type, :value, :balance
  def initialize(date: Date.today.strftime("%d/%m/%y"), type:, value:, balance:)
    @date = date
    @type = type
    @value = value
    @balance = balance
  end
end
