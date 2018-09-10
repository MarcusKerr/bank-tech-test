require 'Transaction'

describe Transaction do
  let(:transaction) { Transaction.new(10, 20, 'debit') }
  # describe 'initialize' do
  #   it 'takes 3 arguments' do
  #     # expect(Transaction).to receive(:new).with(3)
  #   end
  # end

  describe '#date' do
    it "returns the date the transaction was created" do
      expect(transaction.date).to eq Date.today
    end
  end

  describe '#amount' do
    it "returns the amount the transaction was given when created" do
      expect(transaction.amount).to eq 10
    end
  end

  describe '#balance' do
    it "returns the balance the transaction was given when created" do
      expect(transaction.balance).to eq 20
    end
  end

  describe '#type' do
    it "returns the type the transaction was given when created" do
      expect(transaction.type).to eq 'debit'
    end
  end
end 