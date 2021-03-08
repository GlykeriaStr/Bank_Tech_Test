require 'time'
class Transaction

  attr_reader :date, :type, :balance
  def initialize(date: Date.today.strftime("%d/%m/%y"), type:, balance:)
    @date = date
    @type = type
    @balance = balance
  end
end
