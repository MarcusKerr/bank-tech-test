require 'Statement'
require 'Date'

describe Statement do
  let(:transaction)  { double :transaction, date: Date.today, amount: 10, balance: 20, type: 1}
  let(:transaction2) { double :transaction, date: Date.today, amount: 10, balance: 20, type: nil}
  let(:transactions_array) { [transaction]}
  describe '#print' do
    it 'prints a list of transactions' do
      expect{Statement.print(transactions_array)}.to output("date || credit || debit || balance\n#{Date.today} || 10 || || 20\n").to_stdout
    end
  end

  describe '#is_credit?' do
    it 'returns true to signify credit' do
      expect(Statement.is_credit?(transaction)).to eq true
    end

    it 'returns nil to signify debit' do
      expect(Statement.is_credit?(transaction2)).to eq nil
    end
  end
end