class Transaction < Database

  def total_amount(period)
    res = exec("SELECT sum(amount) FROM transactions where purchase_date BETWEEN $1 AND $2",[period.begin, period.end])
    puts "==================================\nTotal sales for #{$report_month}: #{res[0]['sum']}"
  end


  def top_five(period)
    res = exec("SELECT sum(amount),name FROM transactions INNER JOIN products on products.id = transactions.product_id WHERE purchase_date BETWEEN $1 AND $2 GROUP BY name ORDER BY sum desc LIMIT 5",[period.begin, period.end])
    result_hash = {}
    res.each do |row|
      result_hash[row['name']] = row['sum']
    end
    return result_hash
  end

  def display_top_five(period)
    puts "\n==== TOTAL SALES - TOP FIVE PRODUCTS (#{$report_month}) ===="
    top_five(period).each_pair {|key, value| puts "#{printf("%-12s",key)} #{value}"}
  end

  def sales_by_day(period)
    res = exec("
    SELECT date_trunc('day', purchase_date) as day, sum(amount) as revsum
    FROM transactions INNER JOIN products
    ON transactions.product_id = products.id
    WHERE purchase_date BETWEEN $1 AND $2
    GROUP BY day
    ORDER BY day",
    [period.begin, period.end])
  result_hash = {}
  res.each do |row|
    result_hash[row['day']] = row['revsum']
  end
  return result_hash
  end

  def display_sales_by_day(period)
    puts "\n==== TOTAL SALES BY DAY (#{$report_month})  ===="
    sales_by_day(period).each_pair do |key, value|
      puts "#{printf("%-12s",key[0..10])} #{value}"
    end
  end

end
