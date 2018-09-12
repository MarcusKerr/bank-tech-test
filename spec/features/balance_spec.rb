require 'BankAccount'
describe BankAccount do
  it 'shows the balance' do
    subject.deposit(100)
    expect(subject.balance).to eq 100
  end
end