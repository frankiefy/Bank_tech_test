require './lib/statement.rb'

describe Statement do

  context "initializes values" do

    it 'initializes with empty statement' do
      expect(subject.transactions).to eq([])
    end

  end

  context "add_transaction" do

    it 'makes a new line in transactions' do
      subject.add_transaction(["01/01/2017", 5, 9])
      expect(subject.transactions).to eq([["01/01/2017", 5, nil, 9]])
    end

  end

  context "show_statement" do

    it 'shows the statement' do
      subject.add_transaction(["01/01/2017", 5, 9])
      subject.add_transaction(["01/01/2017", -1, 8])
      expect(subject.show_statement).to eq([["01/01/2017", nil, 1, 8], ["01/01/2017", 5, nil, 9]])
    end

  end




end
