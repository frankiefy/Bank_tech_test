require './lib/account.rb'


describe Account do

  context "initializes values" do

    it 'initializes with balance 0' do
      expect(subject.balance).to eq(0)
    end

    it 'initializes with date 01/01/2017' do
      expect(subject.date).to eq('01/01/2017')
    end

    it 'initializes with a statement' do
      expect(subject.statement).to be_a Statement
    end

    it 'initializes with reciepts' do
      expect(subject.receipts).to eq([])
    end

  end

  context "change_date" do
    it 'can change the date' do
      subject.change_date('02/01/2017')
      expect(subject.date).to eq('02/01/2017')
    end
  end

  context "change_overdraft_available" do
    it 'can change the overdraft availablity' do
      subject.change_overdraft_available(true)
      expect(subject.overdraft_available).to eq(true)
    end
    it 'cannot change the overdraft availablity when in debt' do
      subject.change_overdraft_available(true)
      subject.transaction(-1)
      expect { subject.change_overdraft_available(false) }.to raise_error('you cannot change overdraft availablity when in overdraft')
    end
  end

  context "transaction" do
    it 'can transact 1 into account' do
      expect(subject.transaction(1)).to eq(['01/01/2017', 1, 1])
    end
    it 'can transact -1 from account' do
      expect(subject.transaction(-1)).to eq(['01/01/2017', -1, -1])
    end
  end

  context "deposit" do
    it 'can deposit 1 into account' do
      expect(subject.deposit(1)).to eq("Today on 01/01/2017, you deposited £1, your new balance is £1")
    end
    it 'cannot deposit with negative number' do
      expect { subject.deposit(-1) }.to raise_error("positives numbers only")
    end
  end

  context "withdraw" do
    it 'can withdraw 1 from account' do
      subject.change_overdraft_available(true)
      expect(subject.withdraw(1)).to eq("Today on 01/01/2017, you withdrew £1, your new balance is £-1")
    end
    it 'cannot withdraw 1 from account, when no funds' do
      expect { subject.withdraw(1) }.to raise_error("you do not have overdraft available")
    end
    it 'cannot withdraw with negative number' do
      expect { subject.withdraw(-1) }.to raise_error("positives numbers only")
    end
  end

  context "reciepts" do
    it 'contains reciepts from transactions' do
      subject.deposit(1)
      expect(subject.receipts).to eq([["01/01/2017", 1, 1]])
    end
  end


end
