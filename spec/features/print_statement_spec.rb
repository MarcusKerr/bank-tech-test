require 'BankAccount'

describe BankAccount do
  it 'allows user to print a statemnt' do
    subject.deposit(100)
    expect { subject.print_statement }.to output("date || credit || debit || balance\n#{Date.today} || || 100 || 0\n").to_stdout
  end
end
