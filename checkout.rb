class Checkout < Database
#doesn't need to extend from database. Products class should talk to products table


  def calculate_total
    grand_total = 0
    $product_to_add.each do |hash|
      grand_total += hash['total_price'].to_i * hash['purchase_qty'].to_i
    end
    grand_total
  end

  def display_cart
    puts "======== YOUR CART ========"
    puts "#{sprintf("%-8s",'Product')} #{sprintf("%-15s",'Per unit price')} #{sprintf("%-12s",'Quantity')}"
    $product_to_add.each do |hash|
      puts "#{sprintf("%-8s",hash['name'])} #{sprintf("%-15s",hash['total_price'])} #{sprintf("%-12s",hash['purchase_qty'])}"
    end
    puts "=========================="
    print "TOTAL: "
    puts calculate_total   # total doesn't work
  end


end


__END__
