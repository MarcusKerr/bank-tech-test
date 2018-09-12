require_relative 'Transaction'
require_relative 'Statement'
class BankAccount
  attr_reader :balance

  def initialize(overdraft_limit = 1500)
    @balance = 0
    @transactions = []
    @overdraft_limit = -overdraft_limit
  end

  def deposit(amount)
    create_transaction(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Cannot exceed overdraft limit' if @balance - amount < @overdraft_limit
    create_transaction(amount, 'credit')
    @balance -= amount
  end

  def print_statement(statement_class = Statement)
    statement_class.print(@transactions)
  end

  def create_transaction(amount, type = nil, transaction_class = Transaction)
    @transactions << transaction_class.create(amount, @balance, type)
  end

  private :create_transaction
end
