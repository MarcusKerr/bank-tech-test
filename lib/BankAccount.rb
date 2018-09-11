require_relative 'Transaction'
require_relative 'Statement'
class BankAccount
  attr_reader :balance, :transactions

  def initialize(transaction_class = Transaction, statement_class = Statement)
    @balance = 0
    @transactions = []
    @transaction_class = transaction_class
    @statement_class = statement_class
  end

  def deposit(amount)
    create_transaction(amount)
    @balance += amount
  end

  def withdraw(amount)
    create_transaction(amount, 1)
    @balance -= amount
  end

  def print_statement
    @statement_class.print(@transactions)
  end

  def create_transaction(amount, type = nil)
    @transactions << @transaction_class.new(amount, @balance, type)
  end

  private :create_transaction
end
