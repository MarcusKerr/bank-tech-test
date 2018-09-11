require './lib/BankAccount'
monzo = BankAccount.new
monzo.deposit(105.00)
monzo.balance
monzo.withdraw(105.00)
monzo.balance
monzo.deposit(200.00)
monzo.print_statement
