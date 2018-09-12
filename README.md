# Bank
### Week 10 - tech test!

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## How to use 

After clonding this project, fire up the console and navigate to the project's directory.
Once you're there run `bundle install` to install the necessary gems.

```bash
bundle install
```

Next you will need to start IRB and require the `BankAccount.rb` file.

```
irb
require './lib/BankAccount.rb'
```

Now we will want to make instantiate a bank account so we can track our moneis!
```
monzo = BankAccount.new
```

Once you have a bank account, feel free to depsoit and withdraw, go crazy! Both deposit and withdraw take an integer as an argument.
```
monzo.deposit(100)
monzo.withdraw(50)
```
you can withdraw funds past zero and go minus, however there is a defult overdraft limit of 1500. 

When you're ready to see how much you spent on the weekend, go ahead and print your statement.
```
monzo.print_statement
```
Thats it, 
Go nuts!

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


## User stories

from the acceptance critera I devises some user stories:

```
As a client
So that I can accumulate my wealth in a single place
I would like to open a bank account

As a client
So I can add to my wealth
I would like to make deposits to my account

As a client
So I can splurge
I would like to make witrhdrawals from my account

As a client
So I can keep track of my wealth
I would like to print my bank statement and see my transactions.
```

## Additional user stories
```
As a client
So I can check on my wealth
I would like to view my balance
```

##  Objects and messages diagram

Objects  | Messages
------------- | -------------
Client  |
BankAccount  | deposit(amount), withdraw(amount), print_statement, balance


##  Communication diagram

```
BankAccount <-- deposit(amount) --> balance += amount 
BankAccount <-- withdraw(amount) --> balance -= amount
BankAccount <-- print_statement --> transactions
Bankaccount <-- balance --> balance
```


## Edge cases
#### Going minus
I decided to allow the user to make a withdrawal, this is because I felt this would make a more realistic system, I live in minus!
I have set an overdraft limit thought (they cant just continue to go minus, that would be ridiculous). By default the overdraft limit is 1500. this can be overridden by passing an integer as an argument when instantiating a Bank Account.

```
starling = BankAccount.new(3000)
```

## My approach
I stuck to TDD, feature testing in irb and passing those feature tests by writing a unit test in rspec. I encountered some difficulty when I came to writing the `print_statemnt` method as it relied on Transactions, it was at this point I began creating doubles and implemented a few units simultaneously.
