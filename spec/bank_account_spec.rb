require 'BankAccount'
describe BankAccount do
  let(:bank_account) { subject }
  let(:deposit_amount) { 50 }
  let(:withdraw_amount) { 25.50 }

  describe 'initialize' do
    it 'initializes with an 0 balance' do
      expect(bank_account.balance).to eq 0
    end

    it 'intializes with no transactions' do
      expect(bank_account.transactions).to be_empty
    end
  end

  describe '#deposit' do
    it 'increases balance by deposited amount' do
      expect { bank_account.deposit(deposit_amount) }.to change { bank_account.balance }.by deposit_amount
    end

    it 'adds a transaction to the transaction array' do
      bank_account.deposit(50)
      expect(bank_account.transactions).to_not be_empty
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by given amount' do
      bank_account.deposit(deposit_amount)
      expect { bank_account.withdraw(withdraw_amount) }.to change { bank_account.balance }.by -withdraw_amount
    end

    it 'adds a transaction to the transaction array' do
      bank_account.withdraw(withdraw_amount)
      expect(bank_account.transactions).to_not be_empty
    end
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(bank_account.balance).to eq 0
    end
  end

  # describe '#print_statement' do
  #   it 'delagates to the Statement object' do
  #     expect(@statement_class).to receive(:print)
  #     bank_account.print_statement
  #   end
  # end
end
