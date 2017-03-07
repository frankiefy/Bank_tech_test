require_relative 'account.rb'

class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def add_transaction(receipt)
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
    @transactions << new_line
  end

  def show_statement
    puts "date          |  credit  | debit | balance"
    @transactions.each do |line|
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


end
