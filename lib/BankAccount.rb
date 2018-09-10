require_relative 'Transaction'
require_relative 'Statement'
class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @transactions << (Transaction.new(amount, @balance, 'debit'))
    @balance += amount
  end

  def withdraw(amount)
    @transactions << (Transaction.new(amount, @balance, 'credit'))
    @balance -= amount
  end

  def print_statement
  end
end
