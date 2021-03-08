# frozen_string_literal: true

class Statement
  HEADER = "date || credit || debit || balance"

  def print(transactions)
    puts HEADER
    transaction_list(transactions)
  end

  def transaction_list(list)
    list.reverse.each do |t|
      if t.type == :credit
        puts "#{t.date} || #{format(t.value)} || || #{format(t.balance)}"
      else
        puts "#{t.date} || || #{format(t.value)} || #{format(t.balance)}"
      end
    end
  end

  def format(num)
    '%.2f' % num
  end
end
