require 'Transaction'

describe Transaction do
  let(:transaction) { Transaction.new(10, 20, 1) }

  describe 'initialize' do
    it 'takes 3 arguments' do
      expect(Transaction).to respond_to(:new).with(3).arguments
    end
  end

  describe '#date' do
    it 'returns the date the transaction was created' do
      expect(transaction.date).to eq Date.today
    end
  end

  describe '#amount' do
    it 'returns the amount the transaction was given when created' do
      expect(transaction.amount).to eq 10
    end
  end

  describe '#balance' do
    it 'returns the balance the transaction was given when created' do
      expect(transaction.balance).to eq 20
    end
  end

  describe '#type' do
    it 'returns the type the transaction was given when created' do
      expect(transaction.type).to eq 1
    end
  end

  describe '#create' do
    it 'instantiates a transaction' do
      expect(Transaction.create(100, 0, 1)).to be_an_instance_of(Transaction)
    end
  end
end
