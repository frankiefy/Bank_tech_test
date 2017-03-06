class Account

  DEFAULT_BALANCE = 0
  attr_reader :balance, :date

  def initialize
    @balance = DEFAULT_BALANCE
    @date = '01/01/2017'
    @statement = []
  end

  def show_statement
    puts "date          |  credit  | debit | balance"
    @statement.each do |line|
       print line[0].to_s
       print "          "
       print line[1].to_s
       print "        "
       print line[2].to_s
       print "        "
       print line[3].to_s
       puts "\n"
    end
  end

  def change_date(new_date)
    @date = new_date
  end

  def deposit(amount)
    receipt = transaction(amount)
    return "Today on #{@date}, you deposited £#{amount}, your new balance is £#{@balance}"
  end

  def withdraw(amount)
    receipt = transaction(-amount)
    return "Today on #{@date}, you withdrew £#{amount}, your new balance is £#{@balance}"
  end

  def transaction(amount)
    @balance = @balance + amount
    receipt = [@date, amount, @balance]
    add_to_statement(receipt)
    return receipt
  end

  def add_to_statement(receipt)
    new_line = ['date', 'credit', 'debit', 'balance']
    if receipt[1] < 0
      new_line[2] = -(receipt[1])
      new_line[1] = nil
    else
      new_line[1] = receipt[1]
      new_line[2] = nil
    end
    new_line[0] = receipt[0]
    new_line[3] = receipt[2]
    @statement << new_line
  end


end
