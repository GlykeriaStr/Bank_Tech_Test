# frozen_string_literal: true

class Statement
  HEADER = 'date || credit || debit || balance'

  def print(transactions)
    puts HEADER
    transaction_list(transactions)
  end

  def transaction_list(list)
    list.reverse.each do |tr|
      if tr.type == :credit
        puts "#{tr.date} || #{format(tr.value)} || || #{format(tr.balance)}"
      else
        puts "#{tr.date} || || #{format(tr.value)} || #{format(tr.balance)}"
      end
    end
  end

  def format(num)
    '%.2f' % num
  end
end
