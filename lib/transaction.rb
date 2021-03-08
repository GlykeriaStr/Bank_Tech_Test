class Transaction

  attr_reader :date, :type, :balance
  def initialize(date: Date.today, type:, balance:)
    @date = date
    @type = type
    @balance = balance
  end
end
