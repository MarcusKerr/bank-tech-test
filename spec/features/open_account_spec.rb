require 'BankAccount'

describe BankAccount do
  it 'allows user to create a bank account' do
    expect { BankAccount.new }.not_to raise_error
  end
end