require 'BankAccount'

describe BankAccount do
  let(:bank_account) { subject }
  
  describe '#deposit' do
    it 'allows user to make deposits to a bank account' do
      expect { bank_account.deposit(100) }.to change { bank_account.balance }.by 100
    end
  end

  describe '#withdraw' do
    it 'allows user to withdraw from a bank account' do
      expect { bank_account.withdraw(100) }.to change { bank_account.balance }.by -100
    end

    it 'does not allow withdrawals past overdraft limit' do
      expect { bank_account.withdraw(1501) }.to raise_error('Cannot exceed overdraft limit')
    end
  end
end
