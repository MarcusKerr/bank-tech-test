require 'date'
class Transaction

  attr_reader :date, :amount, :balance, :type

  def initialize(amount, new_balance, trans_type)
    @date = Date.today
    @amount = amount
    @balance = new_balance
    @type = trans_type 
  end
end
