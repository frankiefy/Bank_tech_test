require './lib/account.rb'


describe Account do
  test_account = Account.new

  it 'exists' do
    expect(test_account).to exist
  end

end
