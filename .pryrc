require './lib/account.rb'
x = Account.new
x.deposit(5)
x.withdraw(1)
x.deposit(5)
x.withdraw(1)
x.deposit(5)
x.withdraw(1)
x.statement.show_statement
