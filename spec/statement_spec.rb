require 'Statement'
require 'Date'

describe Statement do
  let(:transaction) { double :transaction, date: Date.today, amount: 10, balance: 20, type: 1 }
  let(:transactions_array) { [transaction] }
  describe '#print' do
    it 'prints a list of transactions' do
      expect { Statement.print(transactions_array) }.to output("date || credit || debit || balance\n#{Date.today} || 10 || || 20\n").to_stdout
    end
  end
end
