require 'BankAccount'
describe BankAccount do
  let(:bank_account) { subject }
  let(:deposit_amount) { 50 }
  let(:withdraw_amount) { 25.50 }

  let(:transaction_class) { double :transaction_class, new: transaction}
  let(:transaction) { double :transaction_instance }
  let(:statement_class) { double :statement_class}

  describe 'initialize' do
    it 'initializes with an 0 balance' do
      expect(bank_account.balance).to eq 0
    end

    it 'intializes with no transactions' do
      expect(bank_account.transactions).to be_empty
    end

    it 'overdraft limit defaults to -1500' do
      expect(bank_account.overdraft_limit).to eq -1500
    end

    it 'can pass custom overdraft limit' do
      monzo = BankAccount.new(2900)
      expect(monzo.overdraft_limit).to eq -2900
    end
  end

  describe '#deposit' do
    it 'increases balance by deposited amount' do
      expect { bank_account.deposit(deposit_amount) }.to change { bank_account.balance }.by deposit_amount
    end

    it 'adds a transaction to the transaction array' do
      bank_account.deposit(deposit_amount)
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

    it 'does not allow you to withdraw past overdraft limit' do
      expect{ bank_account.withdraw(1501) }.to raise_error("Cannot exceed overdraft limit")
    end
  end

  describe '#balance' do
    it 'returns the balance' do
      expect(bank_account.balance).to eq 0
    end
  end

  describe '#print_statement' do
    it 'delagates to the Statement object' do
      allow(statement_class).to receive(:print)
      bank_account.print_statement(statement_class)
    end
  end

  # describe '#create transaction' do
  #   it 'delegates to transaction class' do
  #     allow(transaction_class).to receive(:new).and_return(transaction)
  #     expect(bank_account.transactions).to include(transaction)
  #   end
  # end 
end
