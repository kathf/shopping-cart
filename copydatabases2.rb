
require 'rubygems'
require 'pg'

class Database
  def self.connection(dbopts = {})
    @@conn ||= PG.connect(dbopts)
  end
end

class Transaction < Database
  TABLE_NAME = "transactions"

  def initialize(id)
    @id = id
  end

  # Attributes should be a hash { amount: 100, ...etc }
  def self.create(id, price)
    connection.exec("INSERT INTO transactions (product_id, amount, gst, purchase_date) VALUES ($1, $2, $3, $4) RETURNING id", [id, price, price*0.1, Time.now])
  end

  # Attributes should be a hash { amount: 100, ...etc }
  #eg UPDATE products set qty = 10 where name = 'iPad';
  def update(price)
    res = self.class.connection.exec("UPDATE transactions set amount = $2 where id = $1",[@id, price])
  end

  def delete
    self.class.connection.exec("DELETE FROM #{TABLE_NAME} where id = $1", [@id])
  end

  # Should return a hash of attributes
  def read
    res = self.class.connection.exec("SELECT * FROM transactions WHERE id = $1", [@id])
    read_display(res[0])
  end

  def read_display(hash)
    puts "====================="
    hash.each_pair do |key, value|
      puts "#{key}: #{value}"
    end
    puts "====================="
  end

end

Database.connection(dbname: 'sales2db')
Transaction.create((1+rand(9)),3.20)

transaction = Transaction.new(1001)
transaction.read
transaction.update(5.72)
transaction.read
transaction.delete
transaction.read
