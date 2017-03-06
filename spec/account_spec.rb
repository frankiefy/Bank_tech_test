require './lib/account.rb'


describe Account do

  context "initializes values" do

    it 'initializes with balance 0' do
      expect(subject.show_balance).to eq(0)
    end

    it 'initializes with date 01/01/2017' do
      expect(subject.show_date).to eq('01/01/2017')
    end

    it 'initializes with a statement' do
      expect(subject.show_statement).to eq([])
    end

  end

  context "change_date" do
    it 'can change the date' do
      subject.change_date('02/01/2017')
      expect(subject.show_date).to eq('02/01/2017')
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
  end

  context "withdraw" do
    it 'can withdraw 1 from account' do
      expect(subject.withdraw(1)).to eq("Today on 01/01/2017, you withdrew £1, your new balance is £-1")
    end
  end


end
