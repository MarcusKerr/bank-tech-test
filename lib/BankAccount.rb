require_relative 'Transaction'
require_relative 'Statement'
class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << (Transaction.new(amount))
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
  end
end
