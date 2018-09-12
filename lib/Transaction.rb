require 'date'
class Transaction
  attr_reader :date, :amount, :balance, :type

  def initialize(amount, balance, type)
    @date = Date.today
    @amount = amount
    @balance = balance
    @type = type
  end

  def self.create(amount, balance, type)
    Transaction.new(amount, balance, type)
  end
end
