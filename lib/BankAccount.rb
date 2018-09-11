require_relative 'Transaction'
require_relative 'Statement'
class BankAccount
  attr_reader :balance, :transactions

  def initialize(transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @transactions << @transaction_class.new(amount, @balance, 'debit')
    @balance += amount
  end

  def withdraw(amount)
    @transactions << @transaction_class.new(amount, @balance, 'credit')
    @balance -= amount
  end

  def print_statement
  end
end
