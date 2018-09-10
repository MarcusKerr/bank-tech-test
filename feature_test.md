require './lib/bankAccount'
monzo = BankAccount.new
monzo.deposit(105.50)
monzo.balance
monzo.withdraw
monzo.balance
monzo.deposit(0.84)
monzo.print_statement
