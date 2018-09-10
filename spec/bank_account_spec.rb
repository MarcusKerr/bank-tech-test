require 'BankAccount'
describe BankAccount do
  let(:bank_account) { subject }

  describe 'initialize' do
    it 'initializes with an 0 balance' do
      expect(bank_account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases balance by deposited amount' do
      expect { bank_account.deposit(50) }.to change{bank_account.balance}.by 50
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by given amount' do
      bank_account.deposit(50)
      expect { bank_account.withdraw(26.50) }.to change{bank_account.balance}.by -(26.50)
    end
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(bank_account.balance).to eq 0
    end
  end
end
