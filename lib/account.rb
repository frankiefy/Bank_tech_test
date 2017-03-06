class Account

  def initialize
    @balance = 0
    @date = '01/01/2017'
    @statement = []
  end

  def show_statement
    return @statement
  end

  def show_balance
    return @balance
  end

  def show_date
    return @date
  end

  def change_date(new_date)
    @date = new_date
  end

  def deposit(amount)
    recipt = transaction(amount)
    return "Today on #{@date}, you deposited £#{amount}, your new balance is £#{@balance}"
  end

  def withdraw(amount)
    recipt = transaction(-amount)
    return "Today on #{@date}, you withdrew £#{amount}, your new balance is £#{@balance}"
  end

  def transaction(amount)
    @balance = @balance + amount
    recipt = [@date, amount, @balance]
  end


end
