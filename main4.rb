

#Create a Database class which internally uses a PG connection. You can start with the code here. Add the following methods:
  #Return a hash of the top 5 products for a period
  #Return a hash of sales amounts summarised by day

#Create a class for the products table called Product and extends Database. Add methods to print all products along with their total sales.

#Create a class called TransactionSummary. Modify relevant methods in both classes to use a TransactionSummary instance to represent number of sales and amount (say by day or by product) instead of simply a number.

require 'rubygems'
require 'pg'
require './database.rb'
require './transaction_summary4.rb'

##################################

puts "===== MONTHLY SALES REPORT =====\nPlease select a month:\n1. Jan 2015\n2. Feb 2015\n3. Mar 2015\n4. Apr 2015"


selection = true
while  selection != false
  print "Selection (1-4): "
  case gets.to_i
    when 1
      selection = false
      period = (Time.new(2015, 1, 1)...Time.new(2015, 2, 1))
    when 2
      selection = false
      period = (Time.new(2015, 2, 1)...Time.new(2015, 3, 1))
    when 3
      selection = false
      period = (Time.new(2015, 3, 1)...Time.new(2015, 4, 1))
    when 4
      selection = false
      period = (Time.new(2015, 4, 1)...Time.new(2015, 5, 1))
    else
      puts "Error. Please enter again."
  end

end

$report_month = period.begin.strftime("%b")

transaction = TransactionSummary.new(dbname: 'sales2db')
transaction.display_transactions_by_day(period)
transaction.display_transactions_by_prod(period)
