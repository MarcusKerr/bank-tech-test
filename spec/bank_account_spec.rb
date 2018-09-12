require 'BankAccount'
describe BankAccount do
  let(:bank_account) { subject }
  let(:deposit_amount) { 50 }
  let(:withdraw_amount) { 25.50 }
  let(:withdraw_amount) { 25.50 }

  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:transaction) { double :transaction_instance }
  let(:transactions_array) { [transaction] }
  let(:statement_class) { double :statement_class, print: 'a string' }

  describe 'initialize' do
    it 'initializes with an 0 balance' do
      expect(bank_account.balance).to eq 0
    end

    it 'can pass custom overdraft limit' do
      monzo = BankAccount.new(2900)
      monzo.withdraw(2900)
      expect(monzo.balance).to eq -2900
    end
  end

  describe '#deposit' do
    it 'increases balance by deposited amount' do
      expect { bank_account.deposit(deposit_amount) }.to change { bank_account.balance }.by deposit_amount
    end
  end

  describe '#withdraw' do
    it 'reduces the balance by given amount' do
      bank_account.deposit(deposit_amount)
      expect { bank_account.withdraw(withdraw_amount) }.to change { bank_account.balance }.by -withdraw_amount
    end

    it 'does not allow you to withdraw past overdraft limit' do
      expect { bank_account.withdraw(1501) }.to raise_error('Cannot exceed overdraft limit')
    end
  end

  describe '#balance' do
    it 'returns the balance' do
      bank_account.deposit(deposit_amount)
      expect(bank_account.balance).to eq deposit_amount
    end
  end

  describe '#print_statement' do
    it 'delagates to the Statement object' do
      expect(statement_class).to receive(:print)
      bank_account.print_statement(statement_class)
    end
  end
end
