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
    create_transaction(amount, 'debit')
    @balance += amount
  end

  def withdraw(amount)
    create_transaction(amount, 'credit')
    @balance -= amount
  end

  def print_statement
  end

  def create_transaction(amount, type)
    @transactions << @transaction_class.new(amount, @balance, type)
  end

  private :create_transaction
end
