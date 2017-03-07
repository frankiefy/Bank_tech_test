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
    p ["Date", "Credit", "Debit", "Balance"].map!{|header| header.center(20)}.join("||")
    @transactions.reverse.each do |line|
      p line.map!{ |x| x.to_s.center(20) }.join("||")
    end
  end


end
