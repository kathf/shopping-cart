class Product < Database

  def all_products(period)
    res = exec(
      "SELECT sum(amount), name FROM transactions INNER JOIN products on products.id = transactions.product_id WHERE purchase_date between $1 and $2 GROUP BY name ORDER BY sum desc", [period.begin, period.end])
    result_hash = {}
    res.each do |row|
      result_hash[row['name']] = row['sum']
    end
    return result_hash
  end

  def print_all_products(period)
    puts "\n==== TOTAL SALES - ALL PRODUCTS (#{$report_month}) ===="
    all_products(period).each_pair {|key, value| puts "#{printf("%-12s",key)} #{printf("%-12s",value)}"}
  end

end
