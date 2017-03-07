require './lib/account.rb'
x = Account.new
x.deposit(5)
x.withdraw(1)
x.deposit(5)
x.withdraw(1)
x.deposit(5)
x.withdraw(1)
x.statement.show_statement

y = Account.new
y.change_overdraft_available(true)
y.withdraw(1)
y.deposit(1)
y.change_overdraft_available(false)
y.deposit(187)
y.withdraw(54)
y.withdraw(54)
y.deposit(110)
y.statement.show_statement
