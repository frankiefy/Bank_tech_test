require './lib/account.rb'


describe Account do
  test_account = Account.new

  it 'initializes with balance 0' do
    expect(test_account.show_balance).to equal(0)
  end

end
