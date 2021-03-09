# frozen_string_literal: true

require './lib/account'

account = Account.new
puts 'Making some deposits'
account.deposit(100)
account.deposit(400)
account.deposit(500)
account.deposit(1000)
puts 'Printing statement...'
account.print_statement
puts 'Making some withdrawals'
account.withdraw(100)
account.withdraw(200)
account.withdraw(350)
puts 'Printing statement...'
account.print_statement
