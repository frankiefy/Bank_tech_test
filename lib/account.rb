require_relative 'statement.rb'

class Account

  DEFAULT_BALANCE = 0
  attr_reader :balance, :date, :receipts, :overdraft_available, :statement

  def initialize
    @balance = DEFAULT_BALANCE
    @date = '01/01/2017'
    @statement = Statement.new
    @receipts = []
    @overdraft_available = false
  end

  def change_overdraft_available(new_value)
    if balance < 0 && new_value == false
      raise 'you cannot change overdraft availablity when in overdraft'
    end
    @overdraft_available = new_value
  end

  def change_date(new_date)
    @date = new_date
  end

  def deposit(amount)
    raise 'positives numbers only' if amount < 0
    receipt = transaction(amount)
    return "Today on #{@date}, you deposited £#{amount}, your new balance is £#{@balance}"
  end

  def withdraw(amount)
    raise 'positives numbers only' if amount < 0
    if @balance <= 0 && !@overdraft_available
      raise 'you do not have overdraft available'
    else
      receipt = transaction(-amount)
      return "Today on #{@date}, you withdrew £#{amount}, your new balance is £#{@balance}"
    end
  end

  private

  def transaction(amount)
    @balance = @balance + amount
    receipt = [@date, amount, @balance]
    @receipts << receipt
    @statement.add_transaction(receipt)
    return receipt
  end

end
